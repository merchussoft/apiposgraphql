import { loadFilesSync } from "@graphql-tools/load-files";
import { mergeResolvers } from '@graphql-tools/merge';

import path from 'path';

export const resolvers = mergeResolvers(
    loadFilesSync(path.join(__dirname, 'resolvers'), { extensions: ['ts', 'js']})
)