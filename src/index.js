// Harbour Walks: fictional demo app used in the ShipSure Quick Start video.
const _ = require('lodash');
const { format } = require('date-fns');

const trails = [
  { name: 'Bondi to Coogee', km: 6, grade: 'easy' },
  { name: 'Manly Scenic Walkway', km: 10, grade: 'moderate' },
  { name: 'Spit Bridge to Manly', km: 10, grade: 'moderate' },
];

function trailsByGrade(grade) {
  return _.sortBy(trails.filter((t) => t.grade === grade), 'km');
}

function walkSummary(trail, date) {
  return `${trail.name} (${trail.km} km) on ${format(date, 'EEEE d MMMM')}`;
}

module.exports = { trails, trailsByGrade, walkSummary };
