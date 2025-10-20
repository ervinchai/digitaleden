Life Tracker App: Plan of Action
================================

This document outlines the development plan for the Life Tracker application. The project is broken down into epics, and each epic contains a series of tasks. Each task is designed to be implemented and delivered as a single, atomic Pull Request (PR).

### Epic: Project Setup & Core Polymorphic Models

**Goal:** Initialize the application, set up authentication, and create the foundational, distinct database models for different types of trackable items.

*   **PR 1: Project Initialization & Authentication**
    
    *   **Task:** Initialize a new Rails 7 application. Integrate Inertia.js with a Vue.js frontend. Set up Devise for user authentication and generate the necessary views (sign up, login, logout).
        
*   **PR 2: Task Model & Migration**
    
    *   **Task:** Create the Task model. The schema must include: title (string), description (text, for the editor), status (string: 'Pending' or 'Completed'), start\_date (date), start\_time (time), end\_date (date), end\_time (time), and a relationship to the User model.
        
*   **PR 3: Note Model & Migration**
    
    *   **Task:** Create the Note model. The schema must include: title (string), description (text, for the editor), note\_date (date), and a relationship to the User model.
        

### Epic: Calendar-Centric Journaling System

**Goal:** Build the core calendar interface for creating, viewing, and managing Tasks and Notes.

*   **PR 4: Static Month View UI (From Scratch)**
    
    *   **Task:** Build the main calendar Month View from scratch in Vue.js, without an external calendar library.
        
    *   **Method:**
        
        1.  **Date Logic (Frontend):** Use a lightweight JavaScript date utility library (e.g., date-fns or day.js). In the parent Calendar component's state, manage the currently displayed month and year.
            
        2.  **Grid Generation:** Based on the current month, compute a reactive property that generates a grid array. This array should contain all the day objects needed to fill the view, including placeholder days from the previous and next months.
            
        3.  **Frontend Components:** Implement a CalendarHeader with navigation buttons (Previous, Next, Today) that modify the component's state. Create a DayCell component to render each day. Days not in the current month should be visually distinct (e.g., grayed out).
            
    *   **Scope:** This PR is for the static UI shell only and will not load any event data from the backend.
        
*   **PR 5: Static Week & Day View UI (From Scratch)**
    
    *   **Task:** Add Week and Day views to the custom-built calendar component.
        
    *   **Method:** Create new components for these views. The Week view should display a 7-day horizontal layout. The Day view should display a single day with a vertical time grid (e.g., hourly slots from 12 AM to 11 PM). Add view-switcher controls to the CalendarHeader.
        
*   **PR 6: Display Tasks & Notes on Calendar**
    
    *   **Task:** Create a Rails controller action that accepts a date range and returns all Tasks and Notes within that range as JSON. Fetch this data from the Vue components and display the items on the calendar. Differentiate them visually (e.g., with different colors).
        
*   **PR 7: Unified Creation Form**
    
    *   **Task:** Create a single form that can create either a Task or a Note. Use a toggle/select field to switch between the two types, showing/hiding relevant fields (like status and end\_date for Tasks).
        
*   **PR 8: Details Pane for Tasks & Notes**
    
    *   **Task:** Create a sidebar/pane component. When a Task or Note is clicked on the calendar, this pane should display its full details.
        
*   **PR 9: Edit & Delete Tasks & Notes**
    
    *   **Task:** Add functionality within the details pane to edit an existing Task or Note. Implement deletion logic, which must require user confirmation.
        
*   **PR 10: Support for Multi-Day & Timed Tasks**
    
    *   **Task:** Update the creation/edit form for Tasks to fully support start\_time, end\_date, and end\_time. Add an "All-day" toggle. Update the calendar's display logic to render these correctly.
        
*   **PR 11: Recurring Task Backend**
    
    *   **Task:** Add a recurrence\_rule JSONB field to the Task model. Create a backend service to generate future instances of recurring tasks.
        
*   **PR 12: Recurring Task Frontend & Modification Logic**
    
    *   **Task:** Implement the UI to define recurrence rules for Tasks. When editing/deleting a recurring task, implement the modal prompt ("This task only," "This and all future," etc.) and the corresponding backend logic.
        

### Epic: Block-Based Inline Editor

**Goal:** Replace the standard description field with a modern, block-based editor for all relevant models.

*   **PR 13: Integrate Basic Block Editor**
    
    *   **Task:** In the unified creation/edit form, replace the description textarea with a block-based editor (e.g., TipTap). Configure it to save content as JSON. Initial version only needs to support basic paragraphs.
        
*   **PR 14: Slash Command & Core Blocks**
    
    *   **Task:** Implement the slash command menu (/). Add support for: Headings (H1-H3), Bulleted Lists, Numbered Lists, Blockquotes, and Code Blocks.
        
*   **PR 15: Markdown Shortcuts & To-Do Lists**
    
    *   **Task:** Add automatic Markdown-to-block conversion (e.g., ## -> H2). Implement the "To-do List" block with interactive checkboxes.
        

### Epic: Polymorphic Relationship Engine

**Goal:** Create a flexible system for linking any item to any other item, forming the knowledge graph.

*   **PR 16: Polymorphic NodeLink Model**
    
    *   **Task:** Create the NodeLink model and migration. The schema must be polymorphic: source\_id (integer), source\_type (string), target\_id (integer), target\_type (string), and link\_type (string, e.g., 'related\_to').
        
*   **PR 17: Linking UI in Details Pane**
    
    *   **Task:** In the details pane for both Tasks and Notes, add an autocomplete search input that can find and link to any other Task or Note. Display all of an item's links in the same pane.
        
*   **PR 18: Inline Editor Linking (\[\[ trigger)**
    
    *   **Task:** Implement the \[\[ trigger within the block editor. This should open an autocomplete search menu to find any Task or Note and insert a custom "rich link" block into the editor's content.
