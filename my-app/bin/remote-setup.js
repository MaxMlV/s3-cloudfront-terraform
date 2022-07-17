
// This is the same setup script, but pass the contentful
// values from command line arguments all at once.

const spaceImport = require("contentful-import")
const exportFile = require("../contentful/export.json")
const path = require("path")
const { writeFileSync } = require("fs")
const chalk = require("chalk")
const argv = process.argv.slice(2)

let spaceId = argv[0]
let managementToken = argv[1]
let accessToken = argv[2]

console.log("Writing config file...")
const configFiles = [`.env`].map(file => path.join(__dirname, "..", file))

const fileContents = [
    `# Do NOT commit this file to source control`,
    `CONTENTFUL_SPACE_ID='${spaceId}'`,
    `CONTENTFUL_ACCESS_TOKEN='${accessToken}'`,
    ``,
    `# https://www.gatsbyjs.org/packages/gatsby-plugin-mailchimp/?=mailchimp#mailchimp-endpoint`,
    `MAILCHIMP_ENDPOINT='https://example.us10.list-manage.com/subscribe/post?u=123'`,
].join("\n") + "\n"

configFiles.forEach(file => {
    writeFileSync(file, fileContents, "utf8")
    console.log(`Config file ${chalk.yellow(file)} written`)
})

spaceImport({ spaceId, managementToken, content: exportFile })
