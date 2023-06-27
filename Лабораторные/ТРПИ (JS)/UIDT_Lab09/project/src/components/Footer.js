import React from 'react';
import FilterLink from '../containers/FilterLink';
import { VisibilityFilters } from '../actions';

const Footer = () => (
  <div>
    <span>Показать: </span>
    <FilterLink filter={VisibilityFilters.SHOW_ALL}>
      Все задачи
    </FilterLink>
    <FilterLink filter={VisibilityFilters.SHOW_ACTIVE}>
      Активные задачи
    </FilterLink>
    <FilterLink filter={VisibilityFilters.SHOW_COMPLETED}>
      Выполненые задачи
    </FilterLink>
  </div>
);

export default Footer;