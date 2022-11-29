-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT DISTINCT backers_count, cf_id
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT DISTINCT backers.cf_id, campaign.backers_count
FROM backers
JOIN campaign 
ON campaign.cf_id = backers.cf_id
ORDER BY campaign.backers_count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT DISTINCT backers.cf_id, backers.first_name, backers.last_name, backers.email,
(campaign.goal - campaign.pledged) AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM backers 
JOIN campaign 
ON campaign.cf_id = backers.cf_id
WHERE campaign.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;
SELECT * FROM email_contacts_remaining_goal_amount;


-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT backers.email, backers.first_name, backers.last_name, backers.cf_id, 
campaign.company_name, campaign.description, campaign.end_date, (campaign.goal - campaign.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers 
JOIN campaign 
ON campaign.cf_id = backers.cf_id
WHERE campaign.outcome = 'live'
ORDER BY backers.email DESC;
SELECT * FROM email_backers_remaining_goal_amount;

-- Check the table


