function register (registry, context) {
    registry.inlineMacro('link-in-puml', function () {
        this.process((parent, target, attrs) => {
            const anchor = parent.applySubstitutions(`xref:${target}[]`, ['macros'])
            const [_, href, text] = anchor.match(/^<a href="(.+?)"[^>]*>(.*)<\/a>$/)
            return this.createInline(parent, 'quoted', href)
        })
    })
}

module.exports.register = register
