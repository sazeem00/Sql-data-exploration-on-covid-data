select *
from [Portfolio Projects]..coviddeath
order by 3,4

--select *
--from [Portfolio Projects]..CovidVaccinations
--order by 3,4

--select data that we are going to be using

select location,date,total_cases,new_cases,total_deaths,population
from [Portfolio projects]..coviddeath
order by 1,2

--looking at total cases vs total deaths
--show likelyhood of dying if you contract covid in your country
select location,date ,total_cases ,new_cases,(total_deaths/total_cases)*100 as DeathPercentage
from [Portfolio Projects]..coviddeath
where location like '%states%'
order by 1 , 2


--looking at the total cases vs population
--shows what percentage of population got covid
select location,date , population ,total_cases ,(total_cases/population)*100 as deathpercentage
from [Portfolio Projects]..coviddeath
where location like '%states%'
order by 1,2 


--looking at countries with highest infection rate compared to the population
select population ,location ,max(total_cases) as Highestinfectioncount , max(total_cases/population)*100 as percentpopulationinfected
from [Portfolio Projects]..coviddeath
group by Location,Population
order by  percentpopulationinfected desc

--showing countries with highest deathcounts per population
select Location , max(total_deaths) as totaldeathcount
from [Portfolio Projects]..coviddeath
group by location 
order by totaldeathcount desc


--showing continents with highest deathcounts per population 

select location , max(total_deaths) as totaldeathcount
from [Portfolio Projects]..coviddeath
where continent is not null
group by continent
order by totaldeathcount desc


--global numbers

select date , total_cases ,total_deaths ,(total_deaths/total_cases)*100 as deathpercentage
from [Portfolio Projects]..coviddeath
where continent is not null
group by date
order by 1,2


select*
from [Portfolio Projects]..coviddeath as dea
join [Portfolio Projects]..CovidVaccinations as vac
     on dea.location=vac.location
	 and dea.date = vac.date

	 --looking at total population vs vaccination
select*
from [Portfolio Projects]..coviddeath as dea
join [Portfolio Projects]..CovidVaccinations as vac
        on dea.location=vac.location
		and dea.date=vac.date
where dea.continent is not null 
order by 2,3
