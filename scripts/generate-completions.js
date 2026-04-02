#!/usr/bin/env node
// Extracts keywords from tree-sitter-al grammar.js and generates AL.sublime-completions
// Usage: node generate-completions.js <path-to-grammar.js>

const fs = require('fs');
const path = require('path');

const grammarPath = process.argv[2];
if (!grammarPath) {
    console.error('Usage: node generate-completions.js <path-to-grammar.js>');
    process.exit(1);
}

const grammar = fs.readFileSync(grammarPath, 'utf8');

const kwMatches = [...grammar.matchAll(/kw\('(\w+)'\)/g)];
const keywords = [...new Set(kwMatches.map(m => m[1].toLowerCase()))];

const types = [
    'Integer', 'BigInteger', 'Decimal', 'Text', 'Code', 'Boolean', 'Char', 'Byte',
    'Date', 'Time', 'DateTime', 'DateFormula', 'Duration', 'Guid', 'Blob', 'Record',
    'RecordId', 'RecordRef', 'FieldRef', 'KeyRef', 'Option', 'Dialog', 'File',
    'InStream', 'OutStream', 'TextBuilder', 'JsonObject', 'JsonArray', 'JsonToken',
    'JsonValue', 'HttpClient', 'HttpContent', 'HttpHeaders', 'HttpRequestMessage',
    'HttpResponseMessage', 'XmlDocument', 'XmlElement', 'XmlNode', 'XmlNodeList',
    'XmlAttribute', 'List', 'Dictionary', 'Notification', 'ErrorInfo', 'Media',
    'MediaSet', 'Variant', 'Label', 'TextConst', 'SecretText', 'Version', 'DotNet',
    'Action'
];

const completions = [
    ...keywords.sort().map(k => ({ trigger: k, kind: 'keyword' })),
    ...types.sort().map(t => ({ trigger: t, kind: 'type' })),
];

const output = {
    scope: 'source.al',
    completions
};

const outputPath = path.join(path.dirname(__dirname), 'AL.sublime-completions');
fs.writeFileSync(outputPath, JSON.stringify(output, null, 4) + '\n');
console.log(`Generated ${completions.length} completions to ${outputPath}`);
