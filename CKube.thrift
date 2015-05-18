/*
 * This file contains the protocol interface
 */

struct ValidationError {
  1: string field,
  2: string message
}

exception ValidationException {
  1: i32 code,
  2: string message,
  3: list<ValidationError> errors
}

struct Project {
  1: optional string _id,
  2: optional string name,
  4: optional string code,
  3: optional string description
}

enum ConfigurationSpecType {
  CONTROLLER = 1, SERVICE = 2
}

struct ConfigurationSpec {
  1: optional string _id,
  2: required ConfigurationSpecType type,
  3: required string content
}

struct Configuration {
  1: optional string _id,
  2: optional string name,
  3: optional Project project,
  4: optional string expression,
  5: optional list<ConfigurationSpec> specs
}

struct Deployment {
  1: optional string _id,
  2: optional Configuration configuration,
  3: required string params,
  4: optional list<ConfigurationSpec> specs
}

service ProjectService {
  /**
   * 
   */
  Project create(1:Project project)
    throws (1:ValidationException validationException),

  /**
   * 
   */
  Project update(1:Project project)
    throws (1:ValidationException validationException),

  /**
   * 
   */
  list<Project> get(),

  /**
   * 
   */
  Project getById(1:string _id),

  /**
   * 
   */
  void remove(1:Project project)
}

service ConfigurationService {
  /**
   * 
   */
  Configuration create(1:Configuration configuration)
    throws (1:ValidationException validationException),

  /**
   * 
   */
  Configuration update(1:Configuration configuration)
    throws (1:ValidationException validationException),

  /**
   * 
   */
  list<Configuration> get(1:Project project),

  /**
   * 
   */
  Configuration getById(1:string _id),

  /**
   * 
   */
  void remove(1:Configuration configuration)
}

service DeploymentService {
  /**
   * 
   */
  list<Deployment> get()
}
