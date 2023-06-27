"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const react_1 = __importDefault(require("react"));
const Products_1 = __importDefault(require("./Products"));
const FilterableProductTable_1 = __importDefault(require("./components/FilterableProductTable"));
const App = () => {
    return (react_1.default.createElement(FilterableProductTable_1.default, { products: Products_1.default }));
};
exports.default = App;
//# sourceMappingURL=App.js.map