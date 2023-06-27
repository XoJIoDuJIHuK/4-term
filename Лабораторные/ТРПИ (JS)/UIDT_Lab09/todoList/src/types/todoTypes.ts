import VisibilityFilter from "../reducers/visibilityFilter";
import {visibilityFilter} from "./actionTypes";

export interface Todo{
    id:number;
    text:string;
    completed:boolean;
}

export interface Todos {
    todos: Todo[];
    visibilityFiler: visibilityFilter;
}

export interface FilterLinkOwnProps {
    filter: visibilityFilter;
}