import { loadFilesSync } from "@graphql-tools/load-files";
import { mergeResolvers } from '@graphql-tools/merge';
import path from 'path';

const resolversArray = loadFilesSync(path.join(__dirname, 'resolvers'), { extensions: ['ts', 'js']});
const resolversNormalized = resolversArray.map(r => ('default' in r ? r.default : r));
export const resolvers = mergeResolvers(resolversNormalized);