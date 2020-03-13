// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

import Dygraph from "dygraphs"
import "dygraphs/dist/dygraph.min.css"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"

// let data = [];
let graph = null;
let Hooks = {};
Hooks.chart = {
  mounted() {
    console.log("mounted");
  },
  updated() {
    console.log("updated");
    const data = JSON.parse(this.el.dataset.values);
    if (graph === null) {
      const div = this.el;
      graph = new Dygraph(div, data, {
        labels: ["x", "y"],
        legend: 'always',
        connectSeparatedPoints: true,
        labelsDiv: "legend",
      });
    } else {
      graph.updateOptions({ 'file': data });
    }
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks, params: { _csrf_token: csrfToken } });
liveSocket.connect()
