const fs = require('fs')
const _  = require('underscore')

var file_stonks        = 'stonks.json'
var file_main_config   = 'main.json'
var file_ticker_config = 'ticker.json'
var config_file        = 'config'
var exec               = "~/.config/waybar/modules/ticker.sh"

async function genConfig() {
    console.log("generating config...")

    var config = []
    config.push(JSON.parse(fs.readFileSync(file_main_config, 'utf8')))

    var ticker_config = JSON.parse(fs.readFileSync(file_ticker_config, 'utf8'))
    config.push(ticker_config)
    _.each(JSON.parse(fs.readFileSync(file_stonks, 'utf8')), stonk => {
        ticker_config["modules-left"].push("custom/" + stonk.symbol)
        ticker_config["custom/" + stonk.symbol] = {
            "format"      : "{}",
            "return-type" : "json",
            "interval"    : 2,
            "exec"        : ["~/.config/waybar/modules/ticker.sh", stonk.symbol, stonk.limit].join(" ")
        }
    })

    fs.writeFileSync(config_file, JSON.stringify(config, null, 2))
    console.log("config updated")
}

genConfig()
