import './App.css'
import FilteredJobsList from "./containers/FilteredJobsList";
import Header from "./containers/Header";
import SearchBar from "./containers/SearchBar";
import Display from "./containers/Display";
import s from "./styles/App.module.scss"

function App() {

  return (
      <>
        <Header/>
        <div className={s.column}>
            <SearchBar/>
            <FilteredJobsList/>
            <Display/>
        </div>
      </>
  )
}

export default App
