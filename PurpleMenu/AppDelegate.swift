//
//  AppDelegate.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/6/20.
//

import Cocoa
import SwiftUI
import ServiceManagement

extension Notification.Name {
    static let killLauncher = Notification.Name("killLauncher")
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
    var window: NSWindow!
    lazy var popover: NSPopover = {
        let contentView = ContentView()
        let popover = NSPopover()

        popover.contentSize = NSSize(width: 400, height: 400)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)

        return popover
    }()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // guard let button = statusBarItem.button else { return }
        //
        // button.image = NSImage(named: "ventilation")
        // button.imagePosition = .imageLeft
        // button.image?.isTemplate = true
        // button.action = #selector(togglePopover(_:))

        refreshAqi()
        _ = Timer.scheduledTimer(withTimeInterval: 900, repeats: true, block: { (_) in
            self.refreshAqi()
        })

        // https://theswiftdev.com/how-to-launch-a-macos-app-at-login/
        let launcherAppId = "com.andrewng.LauncherApplication"
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = !runningApps.filter { $0.bundleIdentifier == launcherAppId }.isEmpty

        SMLoginItemSetEnabled(launcherAppId as CFString, true)

        if isRunning {
            DistributedNotificationCenter.default().post(name: .killLauncher, object: Bundle.main.bundleIdentifier!)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    // MARK: - Private methods

    @objc func togglePopover(_ sender: AnyObject?) {
        guard let button = statusBarItem.button else { return }

        if popover.isShown {
            popover.performClose(sender)
        } else {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }

    func refreshAqi() {
        PurpleAirApi(sensorId: "67533").getData { (sensor) in
            guard let result = sensor.results?.first,
                  let pm25Str = result.pM2_5Value,
                  let pm25 = Float(pm25Str),
                  let pm25Cf1Str = result.pm2_5_cf_1,
                  let pm25Cf1 = Float(pm25Cf1Str),
                  let humidityStr = result.humidity,
                  let humidity = Float(humidityStr),
                  let button = self.statusBarItem.button
            else { return }

            debugPrint("pm25 = \(pm25), pm25Cf1 = \(pm25Cf1), RH = \(humidity)")

            let aqi = self.pmToEPA(paCf1: pm25Cf1, humidity: humidity)

            DispatchQueue.main.async {
                button.title = "aqi=\(aqi)"
            }
        }
    }

    func pmToAQI(_ pm: Float) -> Int {
        switch pm {
        case 0..<12.1:
            return calcAQI(Cp: pm, Ih: 50, Il: 0, BPh: 12, BPl: 0)
        case 12.1..<35.5:
            return calcAQI(Cp: pm, Ih: 100, Il: 51, BPh: 35.4, BPl: 12.1)
        case 35.5..<55.5:
            return calcAQI(Cp: pm, Ih: 150, Il: 101, BPh: 55.4, BPl: 35.5)
        case 55.5..<150.5:
            return calcAQI(Cp: pm, Ih: 200, Il: 151, BPh: 150.4, BPl: 55.5)
        case 150.5..<250.5:
            return calcAQI(Cp: pm, Ih: 300, Il: 201, BPh: 250.4, BPl: 150.5)
        case 250.5..<350.5:
            return calcAQI(Cp: pm, Ih: 400, Il: 301, BPh: 350.4, BPl: 250.5)
        case let x where x >= 350.5:
            return calcAQI(Cp: pm, Ih: 500, Il: 401, BPh: 500, BPl: 350.5)
        default:
            return 0
        }
    }

    func calcAQI(Cp: Float, Ih: Float, Il: Float, BPh: Float, BPl: Float) -> Int {
        // The AQI equation https://forum.airnowtech.org/t/the-aqi-equation/169
        // c = concentration, I = AQI, and BP = breakpoint
        let a = Ih - Il
        let b = BPh - BPl
        let c = Cp - BPl

        return Int(round((a / b) * c + Il))
    }

    func pmToAQandU(pm: Float) -> Int {
      // formula found on https://www.purpleair.com/map, shown when you hover on the `?` next to `Conversion`
      // PM2.5 (µg/m³) = 0.778 x PA + 2.65
      return pmToAQI(0.778 * pm + 2.65)
    }

    func pmToLRAPA(paCf1: Float) -> Int {
      // formula found on https://www.purpleair.com/map, shown when you hover on the `?` next to `Conversion`
      // 0 - 65 µg/m³ range:
      // LRAPA PM2.5 (µg/m³) = 0.5 x PA (PM2.5 CF=ATM) – 0.66
      // note that this calculation at PurpleAir seems wrong, their PM2.5 values are from CF=ATM (atmo) rather than CF=1 (standard particles)
      return pmToAQI(0.5 * paCf1 - 0.66)
    }

    func pmToEPA(paCf1: Float, humidity: Float) -> Int {
      // formula found on https://www.purpleair.com/map, shown when you hover on the `?` next to `Conversion`
      // 0-250 ug/m3 range (>250 may underestimate true PM2.5):
      // PM2.5 (µg/m³) = 0.534 x PA(cf_1) - 0.0844 x RH + 5.604
      // more at https://cfpub.epa.gov/si/si_public_record_report.cfm?dirEntryId=349513&Lab=CEMM&simplesearch=0&showcriteria=2&sortby=pubDate&timstype=&datebeginpublishedpresented=08/25/2018
      return pmToAQI(0.534 * paCf1 - 0.0844 * humidity + 5.604)
    }
}
