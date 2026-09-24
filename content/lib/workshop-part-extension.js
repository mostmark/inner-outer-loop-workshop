'use strict'

// Builds the lab guide for the whole workshop or for one part of it, so that on a two-day event
// participants only see the part of the day.
//
//   WORKSHOP_PART=all    (default) Part 1 Inner Loop and Part 2 Outer Loop
//   WORKSHOP_PART=inner  Part 1 only
//   WORKSHOP_PART=outer  Part 2 only
//
// The extension sets the AsciiDoc attribute `workshop-part` (pages use it to avoid linking to the
// hidden part), removes the hidden part's pages (inner-loop-*.adoc or outer-loop-*.adoc) from the
// build and drops the hidden part's section (".Part 1: ..." / ".Part 2: ...") from nav.adoc.
const PARTS = {
  all: null,
  inner: { pagePrefix: 'outer-loop-', navTitle: '.Part 2:' },
  outer: { pagePrefix: 'inner-loop-', navTitle: '.Part 1:' },
}

module.exports.register = function () {
  const logger = this.getLogger('workshop-part-extension')
  const part = (process.env.WORKSHOP_PART || 'all').trim().toLowerCase()
  if (!(part in PARTS)) {
    throw new Error(`WORKSHOP_PART must be one of ${Object.keys(PARTS).join(', ')}, got "${part}"`)
  }
  const hidden = PARTS[part]

  this.on('contentClassified', ({ contentCatalog }) => {
    contentCatalog.getComponents().forEach(({ versions }) => {
      versions.forEach((componentVersion) => {
        const asciidoc = componentVersion.asciidoc || (componentVersion.asciidoc = {})
        asciidoc.attributes = Object.assign({}, asciidoc.attributes, { 'workshop-part': part })
      })
    })
    if (!hidden) return

    const pages = contentCatalog.findBy({ family: 'page' }).filter((page) => page.src.relative.startsWith(hidden.pagePrefix))
    pages.forEach((page) => contentCatalog.removeFile(page))

    contentCatalog.findBy({ family: 'nav' }).forEach((nav) => {
      let skipping = false
      const lines = nav.contents.toString().split('\n').filter((line) => {
        if (line.startsWith('.Part ')) skipping = line.startsWith(hidden.navTitle)
        return !skipping
      })
      nav.contents = Buffer.from(lines.join('\n'))
    })
    logger.info(`Building workshop part "${part}": removed ${pages.length} pages of the other part`)
  })
}
