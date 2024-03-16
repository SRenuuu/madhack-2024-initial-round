// import '../models/jobs_response.dart';
// import '../widgets/job_card.dart';
//
// List<JobPosting> mapJobsResponseToJobPosting(List<JobResponseDatum> jobsResponses) {
//   return jobsResponses.map((jobResponse) {
//     return JobPosting(
//       title: jobResponse.title,
//       location: jobResponse.location,
//       description: jobResponse.description,
//       image: jobResponse.employer.image,
//       salaryValue:
//           '${jobResponse.salaryRange.currency} ${jobResponse.salaryRange.low.round().toString()} - ${jobResponse.salaryRange.high.round().toString()}',
//       salaryFrequency: "/Mo",
//       tags: ["Full Time", "Hybrid"],
//       isSaved: false,
//     );
//   }).toList();
// }
