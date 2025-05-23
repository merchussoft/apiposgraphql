import { loadFilesSync } from "@graphql-tools/load-files";
import { mergeTypeDefs } from "@graphql-tools/merge";

import path from 'path';

const types_array = loadFilesSync(path.join(__dirname, './schemas/**/*.graphql'));
export const typeDefs = mergeTypeDefs(types_array);