"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const react_1 = __importDefault(require("react"));
const ProductCategoryRow = ({ category }) => {
    return (react_1.default.createElement("tr", null,
        react_1.default.createElement("th", { colSpan: 2 }, category)));
};
exports.default = ProductCategoryRow;
//# sourceMappingURL=ProductCategoryRow.js.map