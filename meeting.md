Submit the meeting minutes to your group’s Moodle forum after each meeting.
2. Submit a zip file that contains the report (.doc or .pdf) and the sql file (.sql) to the 
Deliverable 1 submission page. Hand drawn ER diagrams can be scanned or 
photographed for submission, just make sure all text is legible. Only one person per 
group should submit a zip file.

**The First Meeting**
**Attendance:** Junyao Shi, Dillon Mitchell

**Discussion:**
The team held its initial meeting to review the project requirements for COMPX225 Project Deliverable 1. The primary goal was to understand the scope of the deliverable, which includes an ER Diagram, a Relational Model, customer-facing wireframes, and a SQL file with table definitions and data. A strategy was discussed to ensure all parts are completed efficiently.

**Topics:**
* Initial breakdown of Deliverable 1 tasks.
* Deciding on a collaboration platform for version control.
* Determining the best starting point for the project to ensure a logical workflow.

**Decisions Made:**
* **Division of Labour:** The team agreed on an initial division of tasks to get the project started.
* **Collaboration Tool:** It was decided to use GitHub for version control and to share project files like the report and SQL code.
* **Starting Point:** The group decided to begin by creating the wireframes for the customer-based requirements first. This will help visualize the user interface and user flow, which will in turn inform the database design.

---

**The Second Meeting**
**Attendance:** Junyao Shi, Dillon Mitchell

**Discussion:**
With the initial wireframes drafted, the team met to focus on the database structure. The discussion centered on identifying all the necessary entities, attributes, and relationships based on the Kiwi Kloset scenario. The requirements for both staff and customer functionalities were analyzed to ensure the database would support all required operations.

**Topics:**
* Identifying key entities (e.g., Costume, Customer, Branch, Staff, Rental, Repair).
* Defining attributes for each entity (e.g., a costume has a description, size, and price).
* Mapping the relationships between entities.

**Decisions Made:**
* **Create ER Diagram:** The team collaborated to create the first official draft of the Entity-Relationship (ER) Diagram.

---

**The Third Meeting**
**Attendance:** Junyao Shi, Dillon Mitchell

**Discussion:**
The group convened to review the first draft of the ER Diagram. During the review, a critical design flaw was discovered. The diagram was missing the foreign key attributes necessary to link the entities together, making the relationships conceptually present but technically impossible to implement.

**Topics:**
* Review of the first draft ER Diagram.
* Identification of missing foreign key attributes.

**Decisions Made:**
* **Emergency Fix:** The team decided to conduct an immediate and thorough revision of the ER Diagram. This involved adding the required foreign key attributes to all relevant entities. For example:
    * Adding a `BranchID` attribute to the `STAFF` entity to associate staff with a specific branch.
    * Adding a `CustomerID` attribute to the `RENTAL` entity to link a rental event to a customer.

---

**The Fourth Meeting**
**Attendance:** Junyao Shi, Dillon Mitchell

**Discussion:**
The team discussed a potential enhancement to the website: adding preview images for each costume. The pros (better user experience) were weighed against the cons (increased database complexity, additional work). It was noted that the project requirements focus on information like description and size, without explicitly requiring images.

**Topics:**
* Feasibility of adding image previews for costumes.
* Impact of this feature on the database schema and project timeline.
* Reviewing the wireframes in light of this discussion.

**Decisions Made:**
* **Adopt Text-Only Solution:** The group decided against implementing image previews. A purely text-based description is sufficient to meet the project requirements and avoids adding significant complexity to the database and website implementation.
* **Update Wireframes:** The wireframes were to be immediately updated to remove any placeholders for images, ensuring the design is consistent with the text-only decision.

---

**The Fifth Meeting**
**Attendance:** Junyao Shi, Dillon Mitchell

**Discussion:**
With a finalized ER Diagram, the team focused on creating the Relational Model. During this process, it was observed that the team's ER Diagram was more detailed than the examples shown in class. A discussion ensued about whether to simplify the diagram for consistency.

**Topics:**
* Converting the corrected ER Diagram into a Relational Model.
* Comparing the style and detail level of the current ER Diagram with course examples.

**Decisions Made:**
* **Create Relational Model:** The team will proceed with creating the Relational Model based on the current, corrected ER Diagram.
* **Maintain Two ER Diagram Versions:** It was decided to keep the original, detailed ER Diagram as the primary design document. Additionally, a second, more simplified version will be drawn to align with the style of the in-class examples, ensuring all bases are covered.

---

**The Sixth Meeting**
**Attendance:** Junyao Shi, Dillon Mitchell

**Discussion:**
In the final meeting, the group focused on the implementation of the database in MySQL and finalizing all submission documents. The Relational Model was used as the blueprint for writing the SQL table definitions.

**Topics:**
* Translating the Relational Model into MySQL `CREATE TABLE` statements.
* Writing `INSERT` statements to populate the database with at least four rows of data per table.
* Final review of all deliverable components: the report, SQL file, and meeting minutes.

**Decisions Made:**
* **Create SQL Database:** The SQL file containing all table definitions and data insertions will be created based on the final Relational Model.
* **Final Submission:** The final zip file containing the report and the .sql file will be prepared and submitted to Moodle.