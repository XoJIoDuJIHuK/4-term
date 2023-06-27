
export type visibilityFilter = {
    SHOW_ALL:string,
    SHOW_COMPLETED:string,
    SHOW_ACTIVE:string,
}

export interface Action {
    type:string;
    text?:string;
    id?:number;
    filter?:string;
    index?:number;
}

export type Dispatch = (parameter: Action) => void;