import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "output", "links", "template" ]

  connect() {
    let entities = JSON.parse(this.data.get("entities").replace(/\\/g,''))
    let content = this.outputTarget.textContent

    for(let index in entities) {
        let regexp = new RegExp(entities[index].text.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), "g")
        content = content.replace(regexp, `<span class="entity entity-${entities[index].type.toLowerCase()}">${entities[index].text} <strong>${entities[index].type}</strong></span>`)
    }
    this.outputTarget.innerHTML = content
  }
}