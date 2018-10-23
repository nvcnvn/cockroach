





















%{
package parser

import (
    "fmt"
    "strings"

    "go/constant"

    "github.com/cockroachdb/cockroach/pkg/sql/coltypes"
    "github.com/cockroachdb/cockroach/pkg/sql/lex"
    "github.com/cockroachdb/cockroach/pkg/sql/privilege"
    "github.com/cockroachdb/cockroach/pkg/sql/sem/tree"
)


const MaxUint = ^uint(0)

const MaxInt = int(MaxUint >> 1)

func unimplemented(sqllex sqlLexer, feature string) int {
    sqllex.(*Scanner).Unimplemented(feature)
    return 1
}

func unimplementedWithIssue(sqllex sqlLexer, issue int) int {
    sqllex.(*Scanner).UnimplementedWithIssue(issue)
    return 1
}

func unimplementedWithIssueDetail(sqllex sqlLexer, issue int, detail string) int {
    sqllex.(*Scanner).UnimplementedWithIssueDetail(issue, detail)
    return 1
}
%}

%{



















type sqlSymUnion struct {
    val interface{}
}























func (u *sqlSymUnion) numVal() *tree.NumVal {
    return u.val.(*tree.NumVal)
}
func (u *sqlSymUnion) strVal() *tree.StrVal {
    if stmt, ok := u.val.(*tree.StrVal); ok {
        return stmt
    }
    return nil
}
func (u *sqlSymUnion) auditMode() tree.AuditMode {
    return u.val.(tree.AuditMode)
}
func (u *sqlSymUnion) bool() bool {
    return u.val.(bool)
}
func (u *sqlSymUnion) strPtr() *string {
    return u.val.(*string)
}
func (u *sqlSymUnion) strs() []string {
    return u.val.([]string)
}
func (u *sqlSymUnion) newTableWithIdx() *tree.TableNameWithIndex {
    tn := u.val.(tree.TableNameWithIndex)
    return &tn
}
func (u *sqlSymUnion) tableWithIdx() tree.TableNameWithIndex {
    return u.val.(tree.TableNameWithIndex)
}
func (u *sqlSymUnion) newTableWithIdxList() tree.TableNameWithIndexList {
    return u.val.(tree.TableNameWithIndexList)
}
func (u *sqlSymUnion) nameList() tree.NameList {
    return u.val.(tree.NameList)
}
func (u *sqlSymUnion) unresolvedName() *tree.UnresolvedName {
    return u.val.(*tree.UnresolvedName)
}
func (u *sqlSymUnion) functionReference() tree.FunctionReference {
    return u.val.(tree.FunctionReference)
}
func (u *sqlSymUnion) tablePatterns() tree.TablePatterns {
    return u.val.(tree.TablePatterns)
}
func (u *sqlSymUnion) normalizableTableNames() tree.NormalizableTableNames {
    return u.val.(tree.NormalizableTableNames)
}
func (u *sqlSymUnion) indexFlags() *tree.IndexFlags {
    return u.val.(*tree.IndexFlags)
}
func (u *sqlSymUnion) arraySubscript() *tree.ArraySubscript {
    return u.val.(*tree.ArraySubscript)
}
func (u *sqlSymUnion) arraySubscripts() tree.ArraySubscripts {
    if as, ok := u.val.(tree.ArraySubscripts); ok {
        return as
    }
    return nil
}
func (u *sqlSymUnion) stmt() tree.Statement {
    if stmt, ok := u.val.(tree.Statement); ok {
        return stmt
    }
    return nil
}
func (u *sqlSymUnion) stmts() []tree.Statement {
    return u.val.([]tree.Statement)
}
func (u *sqlSymUnion) cte() *tree.CTE {
    if cte, ok := u.val.(*tree.CTE); ok {
        return cte
    }
    return nil
}
func (u *sqlSymUnion) ctes() []*tree.CTE {
    return u.val.([]*tree.CTE)
}
func (u *sqlSymUnion) with() *tree.With {
    if with, ok := u.val.(*tree.With); ok {
        return with
    }
    return nil
}
func (u *sqlSymUnion) slct() *tree.Select {
    return u.val.(*tree.Select)
}
func (u *sqlSymUnion) selectStmt() tree.SelectStatement {
    return u.val.(tree.SelectStatement)
}
func (u *sqlSymUnion) colDef() *tree.ColumnTableDef {
    return u.val.(*tree.ColumnTableDef)
}
func (u *sqlSymUnion) constraintDef() tree.ConstraintTableDef {
    return u.val.(tree.ConstraintTableDef)
}
func (u *sqlSymUnion) tblDef() tree.TableDef {
    return u.val.(tree.TableDef)
}
func (u *sqlSymUnion) tblDefs() tree.TableDefs {
    return u.val.(tree.TableDefs)
}
func (u *sqlSymUnion) colQual() tree.NamedColumnQualification {
    return u.val.(tree.NamedColumnQualification)
}
func (u *sqlSymUnion) colQualElem() tree.ColumnQualification {
    return u.val.(tree.ColumnQualification)
}
func (u *sqlSymUnion) colQuals() []tree.NamedColumnQualification {
    return u.val.([]tree.NamedColumnQualification)
}
func (u *sqlSymUnion) colType() coltypes.T {
    if colType, ok := u.val.(coltypes.T); ok {
        return colType
    }
    return nil
}
func (u *sqlSymUnion) tableRefCols() []tree.ColumnID {
    if refCols, ok := u.val.([]tree.ColumnID); ok {
        return refCols
    }
    return nil
}
func (u *sqlSymUnion) castTargetType() coltypes.CastTargetType {
    return u.val.(coltypes.CastTargetType)
}
func (u *sqlSymUnion) colTypes() []coltypes.T {
    return u.val.([]coltypes.T)
}
func (u *sqlSymUnion) int64() int64 {
    return u.val.(int64)
}
func (u *sqlSymUnion) seqOpt() tree.SequenceOption {
    return u.val.(tree.SequenceOption)
}
func (u *sqlSymUnion) seqOpts() []tree.SequenceOption {
    return u.val.([]tree.SequenceOption)
}
func (u *sqlSymUnion) expr() tree.Expr {
    if expr, ok := u.val.(tree.Expr); ok {
        return expr
    }
    return nil
}
func (u *sqlSymUnion) exprs() tree.Exprs {
    return u.val.(tree.Exprs)
}
func (u *sqlSymUnion) selExpr() tree.SelectExpr {
    return u.val.(tree.SelectExpr)
}
func (u *sqlSymUnion) selExprs() tree.SelectExprs {
    return u.val.(tree.SelectExprs)
}
func (u *sqlSymUnion) retClause() tree.ReturningClause {
        return u.val.(tree.ReturningClause)
}
func (u *sqlSymUnion) aliasClause() tree.AliasClause {
    return u.val.(tree.AliasClause)
}
func (u *sqlSymUnion) asOfClause() tree.AsOfClause {
    return u.val.(tree.AsOfClause)
}
func (u *sqlSymUnion) tblExpr() tree.TableExpr {
    return u.val.(tree.TableExpr)
}
func (u *sqlSymUnion) tblExprs() tree.TableExprs {
    return u.val.(tree.TableExprs)
}
func (u *sqlSymUnion) from() *tree.From {
    return u.val.(*tree.From)
}
func (u *sqlSymUnion) int32s() []int32 {
    return u.val.([]int32)
}
func (u *sqlSymUnion) joinCond() tree.JoinCond {
    return u.val.(tree.JoinCond)
}
func (u *sqlSymUnion) when() *tree.When {
    return u.val.(*tree.When)
}
func (u *sqlSymUnion) whens() []*tree.When {
    return u.val.([]*tree.When)
}
func (u *sqlSymUnion) updateExpr() *tree.UpdateExpr {
    return u.val.(*tree.UpdateExpr)
}
func (u *sqlSymUnion) updateExprs() tree.UpdateExprs {
    return u.val.(tree.UpdateExprs)
}
func (u *sqlSymUnion) limit() *tree.Limit {
    return u.val.(*tree.Limit)
}
func (u *sqlSymUnion) targetList() tree.TargetList {
    return u.val.(tree.TargetList)
}
func (u *sqlSymUnion) targetListPtr() *tree.TargetList {
    return u.val.(*tree.TargetList)
}
func (u *sqlSymUnion) privilegeType() privilege.Kind {
    return u.val.(privilege.Kind)
}
func (u *sqlSymUnion) privilegeList() privilege.List {
    return u.val.(privilege.List)
}
func (u *sqlSymUnion) onConflict() *tree.OnConflict {
    return u.val.(*tree.OnConflict)
}
func (u *sqlSymUnion) orderBy() tree.OrderBy {
    return u.val.(tree.OrderBy)
}
func (u *sqlSymUnion) order() *tree.Order {
    return u.val.(*tree.Order)
}
func (u *sqlSymUnion) orders() []*tree.Order {
    return u.val.([]*tree.Order)
}
func (u *sqlSymUnion) groupBy() tree.GroupBy {
    return u.val.(tree.GroupBy)
}
func (u *sqlSymUnion) windowFrame() *tree.WindowFrame {
    return u.val.(*tree.WindowFrame)
}
func (u *sqlSymUnion) windowFrameBounds() tree.WindowFrameBounds {
    return u.val.(tree.WindowFrameBounds)
}
func (u *sqlSymUnion) windowFrameBound() *tree.WindowFrameBound {
    return u.val.(*tree.WindowFrameBound)
}
func (u *sqlSymUnion) distinctOn() tree.DistinctOn {
    return u.val.(tree.DistinctOn)
}
func (u *sqlSymUnion) dir() tree.Direction {
    return u.val.(tree.Direction)
}
func (u *sqlSymUnion) alterTableCmd() tree.AlterTableCmd {
    return u.val.(tree.AlterTableCmd)
}
func (u *sqlSymUnion) alterTableCmds() tree.AlterTableCmds {
    return u.val.(tree.AlterTableCmds)
}
func (u *sqlSymUnion) alterIndexCmd() tree.AlterIndexCmd {
    return u.val.(tree.AlterIndexCmd)
}
func (u *sqlSymUnion) alterIndexCmds() tree.AlterIndexCmds {
    return u.val.(tree.AlterIndexCmds)
}
func (u *sqlSymUnion) isoLevel() tree.IsolationLevel {
    return u.val.(tree.IsolationLevel)
}
func (u *sqlSymUnion) userPriority() tree.UserPriority {
    return u.val.(tree.UserPriority)
}
func (u *sqlSymUnion) readWriteMode() tree.ReadWriteMode {
    return u.val.(tree.ReadWriteMode)
}
func (u *sqlSymUnion) idxElem() tree.IndexElem {
    return u.val.(tree.IndexElem)
}
func (u *sqlSymUnion) idxElems() tree.IndexElemList {
    return u.val.(tree.IndexElemList)
}
func (u *sqlSymUnion) dropBehavior() tree.DropBehavior {
    return u.val.(tree.DropBehavior)
}
func (u *sqlSymUnion) validationBehavior() tree.ValidationBehavior {
    return u.val.(tree.ValidationBehavior)
}
func (u *sqlSymUnion) interleave() *tree.InterleaveDef {
    return u.val.(*tree.InterleaveDef)
}
func (u *sqlSymUnion) partitionBy() *tree.PartitionBy {
    return u.val.(*tree.PartitionBy)
}
func (u *sqlSymUnion) listPartition() tree.ListPartition {
    return u.val.(tree.ListPartition)
}
func (u *sqlSymUnion) listPartitions() []tree.ListPartition {
    return u.val.([]tree.ListPartition)
}
func (u *sqlSymUnion) rangePartition() tree.RangePartition {
    return u.val.(tree.RangePartition)
}
func (u *sqlSymUnion) rangePartitions() []tree.RangePartition {
    return u.val.([]tree.RangePartition)
}
func (u *sqlSymUnion) setZoneConfig() *tree.SetZoneConfig {
    return u.val.(*tree.SetZoneConfig)
}
func (u *sqlSymUnion) tuples() []*tree.Tuple {
    return u.val.([]*tree.Tuple)
}
func (u *sqlSymUnion) tuple() *tree.Tuple {
    return u.val.(*tree.Tuple)
}
func (u *sqlSymUnion) windowDef() *tree.WindowDef {
    return u.val.(*tree.WindowDef)
}
func (u *sqlSymUnion) window() tree.Window {
    return u.val.(tree.Window)
}
func (u *sqlSymUnion) op() tree.Operator {
    return u.val.(tree.Operator)
}
func (u *sqlSymUnion) cmpOp() tree.ComparisonOperator {
    return u.val.(tree.ComparisonOperator)
}
func (u *sqlSymUnion) durationField() tree.DurationField {
    return u.val.(tree.DurationField)
}
func (u *sqlSymUnion) kvOption() tree.KVOption {
    return u.val.(tree.KVOption)
}
func (u *sqlSymUnion) kvOptions() []tree.KVOption {
    if colType, ok := u.val.([]tree.KVOption); ok {
        return colType
    }
    return nil
}
func (u *sqlSymUnion) transactionModes() tree.TransactionModes {
    return u.val.(tree.TransactionModes)
}
func (u *sqlSymUnion) referenceAction() tree.ReferenceAction {
    return u.val.(tree.ReferenceAction)
}
func (u *sqlSymUnion) referenceActions() tree.ReferenceActions {
    return u.val.(tree.ReferenceActions)
}

func (u *sqlSymUnion) scrubOptions() tree.ScrubOptions {
    return u.val.(tree.ScrubOptions)
}
func (u *sqlSymUnion) scrubOption() tree.ScrubOption {
    return u.val.(tree.ScrubOption)
}
func (u *sqlSymUnion) normalizableTableNameFromUnresolvedName() tree.NormalizableTableName {
    return tree.NormalizableTableName{TableNameReference: u.unresolvedName()}
}
func (u *sqlSymUnion) newNormalizableTableNameFromUnresolvedName() *tree.NormalizableTableName {
    return &tree.NormalizableTableName{TableNameReference: u.unresolvedName()}
}
func (u *sqlSymUnion) resolvableFuncRefFromName() tree.ResolvableFunctionReference {
    return tree.ResolvableFunctionReference{FunctionReference: u.unresolvedName()}
}
func (u *sqlSymUnion) rowsFromExpr() *tree.RowsFromExpr {
    return u.val.(*tree.RowsFromExpr)
}
func newNameFromStr(s string) *tree.Name {
    return (*tree.Name)(&s)
}
%}





%token <str> IDENT SCONST BCONST
%token <union>   ICONST FCONST
%token <str> PLACEHOLDER
%token <str> TYPECAST TYPEANNOTATE DOT_DOT
%token <str> LESS_EQUALS GREATER_EQUALS NOT_EQUALS
%token <str> NOT_REGMATCH REGIMATCH NOT_REGIMATCH
%token <str> ERROR






%token <str> ABORT ACTION ADD ADMIN AGGREGATE
%token <str> ALL ALTER ANALYSE ANALYZE AND ANY ANNOTATE_TYPE ARRAY AS ASC
%token <str> ASYMMETRIC AT

%token <str> BACKUP BEGIN BETWEEN BIGINT BIGSERIAL BIT
%token <str> BLOB BOOL BOOLEAN BOTH BY BYTEA BYTES

%token <str> CACHE CANCEL CASCADE CASE CAST CHANGEFEED CHAR
%token <str> CHARACTER CHARACTERISTICS CHECK
%token <str> CLUSTER COALESCE COLLATE COLLATION COLUMN COLUMNS COMMENT COMMIT
%token <str> COMMITTED COMPACT CONCAT CONFIGURATION CONFIGURATIONS CONFIGURE
%token <str> CONFLICT CONSTRAINT CONSTRAINTS CONTAINS CONVERSION COPY COVERING CREATE
%token <str> CROSS CUBE CURRENT CURRENT_CATALOG CURRENT_DATE CURRENT_SCHEMA
%token <str> CURRENT_ROLE CURRENT_TIME CURRENT_TIMESTAMP
%token <str> CURRENT_USER CYCLE

%token <str> DATA DATABASE DATABASES DATE DAY DEC DECIMAL DEFAULT
%token <str> DEALLOCATE DEFERRABLE DELETE DESC
%token <str> DISCARD DISTINCT DO DOMAIN DOUBLE DROP

%token <str> ELSE ENCODING END ENUM ESCAPE EXCEPT
%token <str> EXISTS EXECUTE EXPERIMENTAL
%token <str> EXPERIMENTAL_FINGERPRINTS EXPERIMENTAL_REPLICA
%token <str> EXPERIMENTAL_AUDIT
%token <str> EXPLAIN EXPORT EXTENSION EXTRACT EXTRACT_DURATION

%token <str> FALSE FAMILY FETCH FETCHVAL FETCHTEXT FETCHVAL_PATH FETCHTEXT_PATH
%token <str> FILES FILTER
%token <str> FIRST FLOAT FLOAT4 FLOAT8 FLOORDIV FOLLOWING FOR FORCE_INDEX FOREIGN FROM FULL FUNCTION

%token <str> GLOBAL GRANT GRANTS GREATEST GROUP GROUPING GROUPS

%token <str> HAVING HIGH HISTOGRAM HOUR

%token <str> IMPORT INCREMENT INCREMENTAL IF IFERROR IFNULL ILIKE IN ISERROR
%token <str> INET INET_CONTAINED_BY_OR_EQUALS INET_CONTAINS_OR_CONTAINED_BY
%token <str> INET_CONTAINS_OR_EQUALS INDEX INDEXES INJECT INTERLEAVE INITIALLY
%token <str> INNER INSERT INT INT2VECTOR INT2 INT4 INT8 INT64 INTEGER
%token <str> INTERSECT INTERVAL INTO INVERTED IS ISNULL ISOLATION

%token <str> JOB JOBS JOIN JSON JSONB JSON_SOME_EXISTS JSON_ALL_EXISTS

%token <str> KEY KEYS KV

%token <str> LANGUAGE LATERAL LC_CTYPE LC_COLLATE
%token <str> LEADING LEASE LEAST LEFT LESS LEVEL LIKE LIMIT LIST LOCAL
%token <str> LOCALTIME LOCALTIMESTAMP LOW LSHIFT

%token <str> MATCH MATERIALIZED MINVALUE MAXVALUE MINUTE MONTH

%token <str> NAN NAME NAMES NATURAL NEXT NO NO_INDEX_JOIN NORMAL
%token <str> NOT NOTHING NOTNULL NULL NULLIF NUMERIC

%token <str> OF OFF OFFSET OID OIDVECTOR ON ONLY OPTION OPTIONS OR
%token <str> ORDER ORDINALITY OUT OUTER OVER OVERLAPS OVERLAY OWNED OPERATOR

%token <str> PARENT PARTIAL PARTITION PASSWORD PAUSE PHYSICAL PLACING
%token <str> PLANS POSITION PRECEDING PRECISION PREPARE PRIMARY PRIORITY
%token <str> PROCEDURAL PUBLICATION

%token <str> QUERIES QUERY

%token <str> RANGE RANGES READ REAL RECURSIVE REF REFERENCES
%token <str> REGCLASS REGPROC REGPROCEDURE REGNAMESPACE REGTYPE
%token <str> REMOVE_PATH RENAME REPEATABLE REPLACE
%token <str> RELEASE RESET RESTORE RESTRICT RESUME RETURNING REVOKE RIGHT
%token <str> ROLE ROLES ROLLBACK ROLLUP ROW ROWS RSHIFT RULE

%token <str> SAVEPOINT SCATTER SCHEMA SCHEMAS SCRUB SEARCH SECOND SELECT SEQUENCE SEQUENCES
%token <str> SERIAL SERIAL2 SERIAL4 SERIAL8
%token <str> SERIALIZABLE SERVER SESSION SESSIONS SESSION_USER SET SETTING SETTINGS
%token <str> SHOW SIMILAR SIMPLE SMALLINT SMALLSERIAL SNAPSHOT SOME SPLIT SQL

%token <str> START STATISTICS STATUS STDIN STRICT STRING STORE STORED STORING SUBSTRING
%token <str> SYMMETRIC SYNTAX SYSTEM SUBSCRIPTION

%token <str> TABLE TABLES TEMP TEMPLATE TEMPORARY TESTING_RANGES EXPERIMENTAL_RANGES TESTING_RELOCATE EXPERIMENTAL_RELOCATE TEXT THEN
%token <str> TIME TIMETZ TIMESTAMP TIMESTAMPTZ TO TRAILING TRACE TRANSACTION TREAT TRIGGER TRIM TRUE
%token <str> TRUNCATE TRUSTED TYPE
%token <str> TRACING

%token <str> UNBOUNDED UNCOMMITTED UNION UNIQUE UNKNOWN UNLOGGED
%token <str> UPDATE UPSERT USE USER USERS USING UUID

%token <str> VALID VALIDATE VALUE VALUES VARCHAR VARIADIC VIEW VARYING VIRTUAL

%token <str> WHEN WHERE WINDOW WITH WITHIN WITHOUT WORK WRITE

%token <str> YEAR

%token <str> ZONE









%token NOT_LA WITH_LA AS_LA

%union {
  id    int
  pos   int
  str   string
  union sqlSymUnion
}

%type <union>   stmt_block
%type <union>   stmt_list
%type <union>   stmt

%type <union>   alter_stmt
%type <union>   alter_ddl_stmt
%type <union>   alter_table_stmt
%type <union>   alter_index_stmt
%type <union>   alter_view_stmt
%type <union>   alter_sequence_stmt
%type <union>   alter_database_stmt
%type <union>   alter_user_stmt
%type <union>   alter_range_stmt


%type <union>   alter_zone_range_stmt


%type <union>   alter_onetable_stmt
%type <union>   alter_split_stmt
%type <union>   alter_rename_table_stmt
%type <union>   alter_scatter_stmt
%type <union>   alter_relocate_stmt
%type <union>   alter_relocate_lease_stmt
%type <union>   alter_zone_table_stmt


%type <union>   alter_rename_database_stmt
%type <union>   alter_zone_database_stmt


%type <union>   alter_user_password_stmt


%type <union>   alter_oneindex_stmt
%type <union>   alter_scatter_index_stmt
%type <union>   alter_split_index_stmt
%type <union>   alter_rename_index_stmt
%type <union>   alter_relocate_index_stmt
%type <union>   alter_relocate_index_lease_stmt
%type <union>   alter_zone_index_stmt


%type <union>   alter_rename_view_stmt


%type <union>   alter_rename_sequence_stmt
%type <union>   alter_sequence_options_stmt

%type <union>   backup_stmt
%type <union>   begin_stmt

%type <union>   cancel_stmt
%type <union>   cancel_jobs_stmt
%type <union>   cancel_queries_stmt
%type <union>   cancel_sessions_stmt


%type <union>   scrub_stmt
%type <union>   scrub_database_stmt
%type <union>   scrub_table_stmt
%type <union>   opt_scrub_options_clause
%type <union>   scrub_option_list
%type <union>   scrub_option

%type <union>   comment_stmt
%type <union>   commit_stmt
%type <union>   copy_from_stmt

%type <union>   create_stmt
%type <union>   create_changefeed_stmt
%type <union>   create_ddl_stmt
%type <union>   create_database_stmt
%type <union>   create_index_stmt
%type <union>   create_role_stmt
%type <union>   create_table_stmt
%type <union>   create_table_as_stmt
%type <union>   create_user_stmt
%type <union>   create_view_stmt
%type <union>   create_sequence_stmt
%type <union>   create_stats_stmt
%type <union>   create_type_stmt
%type <union>   delete_stmt
%type <union>   discard_stmt

%type <union>   drop_stmt
%type <union>   drop_ddl_stmt
%type <union>   drop_database_stmt
%type <union>   drop_index_stmt
%type <union>   drop_role_stmt
%type <union>   drop_table_stmt
%type <union>   drop_user_stmt
%type <union>   drop_view_stmt
%type <union>   drop_sequence_stmt

%type <union>   explain_stmt
%type <union>   prepare_stmt
%type <union>   preparable_stmt
%type <union>   export_stmt
%type <union>   execute_stmt
%type <union>   deallocate_stmt
%type <union>   grant_stmt
%type <union>   insert_stmt
%type <union>   import_stmt
%type <union>   pause_stmt
%type <union>   release_stmt
%type <union>   reset_stmt reset_session_stmt reset_csetting_stmt
%type <union>   resume_stmt
%type <union>   restore_stmt
%type <union>   revoke_stmt
%type <union>   select_stmt
%type <union>   abort_stmt
%type <union>   rollback_stmt
%type <union>   savepoint_stmt

%type <union>   preparable_set_stmt nonpreparable_set_stmt
%type <union>   set_session_stmt
%type <union>   set_csetting_stmt
%type <union>   set_transaction_stmt
%type <union>   set_exprs_internal
%type <union>   generic_set
%type <union>   set_rest_more
%type <union>   set_names

%type <union>   show_stmt
%type <union>   show_backup_stmt
%type <union>   show_columns_stmt
%type <union>   show_constraints_stmt
%type <union>   show_create_stmt
%type <union>   show_csettings_stmt
%type <union>   show_databases_stmt
%type <union>   show_fingerprints_stmt
%type <union>   show_grants_stmt
%type <union>   show_histogram_stmt
%type <union>   show_indexes_stmt
%type <union>   show_jobs_stmt
%type <union>   show_queries_stmt
%type <union>   show_ranges_stmt
%type <union>   show_roles_stmt
%type <union>   show_schemas_stmt
%type <union>   show_session_stmt
%type <union>   show_sessions_stmt
%type <union>   show_stats_stmt
%type <union>   show_syntax_stmt
%type <union>   show_tables_stmt
%type <union>   show_trace_stmt
%type <union>   show_transaction_stmt
%type <union>   show_users_stmt
%type <union>   show_zone_stmt

%type <str> session_var
%type <str> comment_text

%type <union>   transaction_stmt
%type <union>   truncate_stmt
%type <union>   update_stmt
%type <union>   upsert_stmt
%type <union>   use_stmt

%type <union>   opt_incremental
%type <union>   kv_option
%type <union>   kv_option_list opt_with_options var_set_list
%type <str> import_format

%type <union>   select_no_parens
%type <union>   select_clause select_with_parens simple_select values_clause table_clause simple_select_clause
%type <union>   set_operation

%type <union>   alter_column_default
%type <union>   opt_asc_desc

%type <union>   alter_table_cmd
%type <union>   alter_table_cmds
%type <union>   alter_index_cmd
%type <union>   alter_index_cmds

%type <union>   opt_drop_behavior
%type <union>   opt_interleave_drop_behavior

%type <union>   opt_validate_behavior

%type <str> opt_template_clause opt_encoding_clause opt_lc_collate_clause opt_lc_ctype_clause
%type <union>   opt_password

%type <union>   transaction_iso_level
%type <union>   transaction_user_priority
%type <union>   transaction_read_mode

%type <str> name opt_name opt_name_parens opt_to_savepoint
%type <str> privilege savepoint_name

%type <union>   subquery_op
%type <union>   func_name
%type <str> opt_collate

%type <str> database_name index_name opt_index_name column_name insert_column_item statistics_name window_name
%type <str> family_name opt_family_name table_alias_name constraint_name target_name zone_name partition_name collation_name
%type <union>   table_name sequence_name type_name view_name db_object_name simple_db_object_name complex_db_object_name
%type <union>   table_pattern complex_table_pattern
%type <union>   column_path prefixed_column_path column_path_with_star
%type <union>   insert_target

%type <union>   table_name_with_index
%type <union>   table_name_with_index_list

%type <union>   math_op

%type <union>   iso_level
%type <union>   user_priority

%type <union>   opt_table_elem_list table_elem_list
%type <union>   opt_interleave
%type <union>   opt_partition_by partition_by
%type <str> partition opt_partition
%type <union>   list_partition
%type <union>   list_partitions
%type <union>   range_partition
%type <union>   range_partitions
%type <empty> opt_all_clause
%type <union>   distinct_clause
%type <union>   distinct_on_clause
%type <union>   opt_column_list insert_column_list
%type <union>   sort_clause opt_sort_clause
%type <union>   sortby_list
%type <union>   index_params
%type <union>   name_list privilege_list
%type <union>   opt_array_bounds
%type <union>   from_clause update_from_clause
%type <union>   from_list rowsfrom_list
%type <union>   table_pattern_list single_table_pattern_list
%type <union>   table_name_list
%type <union>   expr_list opt_expr_list tuple1_ambiguous_values tuple1_unambiguous_values
%type <union>   expr_tuple1_ambiguous expr_tuple_unambiguous
%type <union>   attrs
%type <union>   target_list
%type <union>   set_clause_list
%type <union>   set_clause multiple_set_clause
%type <union>   array_subscripts
%type <union>   group_clause
%type <union>   select_limit
%type <union>   relation_expr_list
%type <union>   returning_clause

%type <union>   sequence_option_list opt_sequence_option_list
%type <union>   sequence_option_elem

%type <union>   all_or_distinct
%type <empty> join_outer
%type <union>   join_qual
%type <str> join_type

%type <union>   extract_list
%type <union>   overlay_list
%type <union>   position_list
%type <union>   substr_list
%type <union>   trim_list
%type <union>   execute_param_clause
%type <union>   opt_interval interval_second interval_qualifier
%type <union>   overlay_placing

%type <union>   opt_unique
%type <union>   opt_using_gin_btree

%type <union>   limit_clause offset_clause opt_limit_clause
%type <union>   select_limit_value
%type <union>   opt_select_fetch_first_value
%type <empty> row_or_rows
%type <empty> first_or_next

%type <union>   insert_rest
%type <union>   opt_conf_expr opt_col_def_list
%type <union>   on_conflict

%type <union>   begin_transaction
%type <union>   transaction_mode_list transaction_mode

%type <union>   opt_storing
%type <union>   column_def
%type <union>   table_elem
%type <union>   where_clause
%type <union>   array_subscript
%type <union>   opt_slice_bound
%type <union>   opt_index_flags
%type <union>   index_flags_param
%type <union>   index_flags_param_list
%type <union>   a_expr b_expr c_expr d_expr
%type <union>   substr_from substr_for
%type <union>   in_expr
%type <union>   having_clause
%type <union>   array_expr
%type <union>   interval
%type <union>   type_list prep_type_clause
%type <union>   array_expr_list
%type <union>   row labeled_row
%type <union>   case_expr case_arg case_default
%type <union>   when_clause
%type <union>   when_clause_list
%type <union>   sub_type
%type <union>   numeric_only
%type <union>   alias_clause opt_alias_clause
%type <union>   opt_ordinality opt_compact
%type <union>   sortby
%type <union>   index_elem
%type <union>   table_ref func_table
%type <union>   rowsfrom_list
%type <union>   rowsfrom_item
%type <union>   joined_table
%type <union>   relation_expr
%type <union>   table_name_expr_opt_alias_idx table_name_expr_with_index
%type <union>   target_elem
%type <union>   single_set_clause
%type <union>   as_of_clause opt_as_of_clause
%type <union>   opt_changefeed_sink

%type <str> explain_option_name
%type <union>   explain_option_list

%type <union>   typename simple_typename const_typename
%type <union>   numeric opt_numeric_modifiers
%type <union>   opt_float
%type <union>   character_with_length character_without_length
%type <union>   const_datetime const_interval
%type <union>   bit_with_length bit_without_length
%type <union>   character_base
%type <union>   postgres_oid
%type <union>   cast_target
%type <str> extract_arg
%type <empty> opt_varying

%type <union>   signed_iconst
%type <union>   signed_iconst64
%type <union>   iconst64
%type <union>   var_value
%type <union>   var_list
%type <union>   var_name
%type <str> unrestricted_name type_function_name
%type <str> non_reserved_word
%type <str> non_reserved_word_or_sconst
%type <union>   zone_value
%type <union>   string_or_placeholder
%type <union>   string_or_placeholder_list

%type <str> unreserved_keyword type_func_name_keyword
%type <str> col_name_keyword reserved_keyword

%type <union>   table_constraint constraint_elem
%type <union>   index_def
%type <union>   family_def
%type <union>   col_qual_list
%type <union>   col_qualification
%type <union>   col_qualification_elem
%type <empty> key_match
%type <union>   reference_actions
%type <union>   reference_action reference_on_delete reference_on_update

%type <union>   func_application func_expr_common_subexpr special_function
%type <union>   func_expr func_expr_windowless
%type <empty> opt_with
%type <union>   with_clause opt_with_clause
%type <union>   cte_list
%type <union>   common_table_expr

%type <empty> within_group_clause
%type <union>   filter_clause
%type <union>   opt_partition_clause
%type <union>   window_clause window_definition_list
%type <union>   window_definition over_clause window_specification
%type <str> opt_existing_window_name
%type <union>   opt_frame_clause
%type <union>   frame_extent
%type <union>   frame_bound

%type <union>   opt_tableref_col_list tableref_col_list

%type <union>   targets targets_roles changefeed_targets
%type <union>   opt_on_targets_roles
%type <union>   for_grantee_clause
%type <union>   privileges
%type <union>   audit_mode

%type <str> relocate_kw ranges_kw

%type <union>   set_zone_config

%type <union>   opt_alter_column_using


%nonassoc  VALUES
%nonassoc  SET
%left      UNION EXCEPT
%left      INTERSECT
%left      OR
%left      AND
%right     NOT
%nonassoc  IS ISNULL NOTNULL
%nonassoc  '<' '>' '=' LESS_EQUALS GREATER_EQUALS NOT_EQUALS CONTAINS CONTAINED_BY '?' JSON_SOME_EXISTS JSON_ALL_EXISTS
%nonassoc  '~' BETWEEN IN LIKE ILIKE SIMILAR NOT_REGMATCH REGIMATCH NOT_REGIMATCH NOT_LA
%nonassoc  ESCAPE
%nonassoc  OVERLAPS
%left      POSTFIXOP























%nonassoc  UNBOUNDED
%nonassoc  IDENT NULL PARTITION RANGE ROWS GROUPS PRECEDING FOLLOWING CUBE ROLLUP
%left      CONCAT FETCHVAL FETCHTEXT FETCHVAL_PATH FETCHTEXT_PATH REMOVE_PATH
%left      '|'
%left      '#'
%left      '&'
%left      LSHIFT RSHIFT INET_CONTAINS_OR_EQUALS INET_CONTAINED_BY_OR_EQUALS INET_CONTAINS_OR_CONTAINED_BY
%left      '+' '-'
%left      '*' '/' FLOORDIV '%'
%left      '^'

%left      AT
%left      COLLATE
%right     UMINUS
%left      '[' ']'
%left      '(' ')'
%left      TYPEANNOTATE
%left      TYPECAST
%left      '.'





%left      JOIN CROSS LEFT FULL RIGHT INNER NATURAL
%right     HELPTOKEN

%%

stmt_block:
  stmt_list
  {
    sqllex.(*Scanner).stmts = $1.stmts()
  }

stmt_list:
  stmt_list ';' stmt
  {
    l := $1.stmts()
    s := $3.stmt()
    if s != nil {
      l = append(l, s)
    }
    $$.val = l
  }
| stmt
  {
    $$.val = []tree.Statement(nil)
    s := $1.stmt()
    if s != nil {
       $$.val = []tree.Statement{s}
    }
  }

stmt:
  HELPTOKEN { return helpWith(sqllex, "") }
| preparable_stmt
| copy_from_stmt
| comment_stmt
| execute_stmt       %prec VALUES |  execute_stmt       HELPTOKEN %prec UMINUS { return helpWith(sqllex, "EXECUTE") }
| deallocate_stmt    %prec VALUES |  deallocate_stmt    HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DEALLOCATE") }
| discard_stmt       %prec VALUES |  discard_stmt       HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DISCARD") }
| export_stmt        %prec VALUES |  export_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "EXPORT") }
| grant_stmt         %prec VALUES |  grant_stmt         HELPTOKEN %prec UMINUS { return helpWith(sqllex, "GRANT") }
| prepare_stmt       %prec VALUES |  prepare_stmt       HELPTOKEN %prec UMINUS { return helpWith(sqllex, "PREPARE") }
| revoke_stmt        %prec VALUES |  revoke_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "REVOKE") }
| savepoint_stmt     %prec VALUES |  savepoint_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SAVEPOINT") }
| release_stmt       %prec VALUES |  release_stmt       HELPTOKEN %prec UMINUS { return helpWith(sqllex, "RELEASE") }
| nonpreparable_set_stmt
| transaction_stmt
|
  {
    $$.val = tree.Statement(nil)
  }




alter_stmt:
  alter_ddl_stmt
| alter_user_stmt      %prec VALUES |  alter_user_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "ALTER USER") }
| ALTER error          { return helpWith(sqllex, "ALTER") }

alter_ddl_stmt:
  alter_table_stmt     %prec VALUES |   alter_table_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "ALTER TABLE") }
| alter_index_stmt     %prec VALUES |  alter_index_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "ALTER INDEX") }
| alter_view_stmt      %prec VALUES |  alter_view_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "ALTER VIEW") }
| alter_sequence_stmt  %prec VALUES |  alter_sequence_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "ALTER SEQUENCE") }
| alter_database_stmt  %prec VALUES |  alter_database_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "ALTER DATABASE") }
| alter_range_stmt     %prec VALUES |  alter_range_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "ALTER RANGE") }







































alter_table_stmt:
  alter_onetable_stmt
| alter_relocate_stmt
| alter_relocate_lease_stmt
| alter_split_stmt
| alter_scatter_stmt
| alter_zone_table_stmt
| alter_rename_table_stmt


| ALTER TABLE error      { return helpWith(sqllex, "ALTER TABLE") }
| ALTER PARTITION error  { return helpWith(sqllex, "ALTER TABLE") }






alter_view_stmt:
  alter_rename_view_stmt


| ALTER VIEW error  { return helpWith(sqllex, "ALTER VIEW") }











alter_sequence_stmt:
  alter_rename_sequence_stmt
| alter_sequence_options_stmt
| ALTER SEQUENCE error  { return helpWith(sqllex, "ALTER SEQUENCE") }

alter_sequence_options_stmt:
  ALTER SEQUENCE sequence_name sequence_option_list
  {
    $$.val = &tree.AlterSequence{Name: $3.normalizableTableNameFromUnresolvedName(), Options: $4.seqOpts(), IfExists: false}
  }
| ALTER SEQUENCE IF EXISTS sequence_name sequence_option_list
  {
    $$.val = &tree.AlterSequence{Name: $5.normalizableTableNameFromUnresolvedName(), Options: $6.seqOpts(), IfExists: true}
  }






alter_user_stmt:
  alter_user_password_stmt
| ALTER USER error  { return helpWith(sqllex, "ALTER USER") }






alter_database_stmt:
  alter_rename_database_stmt
|  alter_zone_database_stmt


| ALTER DATABASE error  { return helpWith(sqllex, "ALTER DATABASE") }















alter_range_stmt:
  alter_zone_range_stmt
| ALTER RANGE error  { return helpWith(sqllex, "ALTER RANGE") }












alter_index_stmt:
  alter_oneindex_stmt
| alter_relocate_index_stmt
| alter_relocate_index_lease_stmt
| alter_split_index_stmt
| alter_scatter_index_stmt
| alter_rename_index_stmt
| alter_zone_index_stmt


| ALTER INDEX error  { return helpWith(sqllex, "ALTER INDEX") }

alter_onetable_stmt:
  ALTER TABLE relation_expr alter_table_cmds
  {
    $$.val = &tree.AlterTable{Table: $3.normalizableTableNameFromUnresolvedName(), IfExists: false, Cmds: $4.alterTableCmds()}
  }
| ALTER TABLE IF EXISTS relation_expr alter_table_cmds
  {
    $$.val = &tree.AlterTable{Table: $5.normalizableTableNameFromUnresolvedName(), IfExists: true, Cmds: $6.alterTableCmds()}
  }

alter_oneindex_stmt:
  ALTER INDEX table_name_with_index alter_index_cmds
  {
    $$.val = &tree.AlterIndex{Index: $3.newTableWithIdx(), IfExists: false, Cmds: $4.alterIndexCmds()}
  }
| ALTER INDEX IF EXISTS table_name_with_index alter_index_cmds
  {
    $$.val = &tree.AlterIndex{Index: $5.newTableWithIdx(), IfExists: true, Cmds: $6.alterIndexCmds()}
  }

alter_split_stmt:
  ALTER TABLE table_name SPLIT AT select_stmt
  {
    $$.val = &tree.Split{Table: $3.newNormalizableTableNameFromUnresolvedName(), Rows: $6.slct()}
  }

alter_split_index_stmt:
  ALTER INDEX table_name_with_index SPLIT AT select_stmt
  {
    $$.val = &tree.Split{Index: $3.newTableWithIdx(), Rows: $6.slct()}
  }

relocate_kw:
  TESTING_RELOCATE
| EXPERIMENTAL_RELOCATE

alter_relocate_stmt:
  ALTER TABLE table_name relocate_kw select_stmt
  {

    $$.val = &tree.Relocate{Table: $3.newNormalizableTableNameFromUnresolvedName(), Rows: $5.slct()}
  }

alter_relocate_index_stmt:
  ALTER INDEX table_name_with_index relocate_kw select_stmt
  {

    $$.val = &tree.Relocate{Index: $3.newTableWithIdx(), Rows: $5.slct()}
  }

alter_relocate_lease_stmt:
  ALTER TABLE table_name relocate_kw LEASE select_stmt
  {

    $$.val = &tree.Relocate{Table: $3.newNormalizableTableNameFromUnresolvedName(), Rows: $6.slct(), RelocateLease: true}
  }

alter_relocate_index_lease_stmt:
  ALTER INDEX table_name_with_index relocate_kw LEASE select_stmt
  {

    $$.val = &tree.Relocate{Index: $3.newTableWithIdx(), Rows: $6.slct(), RelocateLease: true}
  }

alter_zone_range_stmt:
  ALTER RANGE zone_name set_zone_config
  {
     s := $4.setZoneConfig()
     s.ZoneSpecifier = tree.ZoneSpecifier{NamedZone: tree.UnrestrictedName($3)}
     $$.val = s
  }

set_zone_config:
  CONFIGURE ZONE to_or_eq a_expr
  {

    $$.val = &tree.SetZoneConfig{YAMLConfig: $4.expr()}
  }
| CONFIGURE ZONE USING var_set_list
  {
    $$.val = &tree.SetZoneConfig{Options: $4.kvOptions()}
  }
| CONFIGURE ZONE USING DEFAULT
  {

    $$.val = &tree.SetZoneConfig{SetDefault: true}
  }
| CONFIGURE ZONE DISCARD
  {
    $$.val = &tree.SetZoneConfig{YAMLConfig: tree.DNull}
  }

alter_zone_database_stmt:
  ALTER DATABASE database_name set_zone_config
  {
     s := $4.setZoneConfig()
     s.ZoneSpecifier = tree.ZoneSpecifier{Database: tree.Name($3)}
     $$.val = s
  }

alter_zone_table_stmt:
  ALTER TABLE table_name set_zone_config
  {
    s := $4.setZoneConfig()
    s.ZoneSpecifier = tree.ZoneSpecifier{
       TableOrIndex: tree.TableNameWithIndex{Table: $3.normalizableTableNameFromUnresolvedName()},
    }
    $$.val = s
  }
| ALTER PARTITION partition_name OF TABLE table_name set_zone_config
  {
    s := $7.setZoneConfig()
    s.ZoneSpecifier = tree.ZoneSpecifier{
       TableOrIndex: tree.TableNameWithIndex{Table: $6.normalizableTableNameFromUnresolvedName()},
       Partition: tree.Name($3),
    }
    $$.val = s
  }

alter_zone_index_stmt:
  ALTER INDEX table_name_with_index set_zone_config
  {
    s := $4.setZoneConfig()
	s.ZoneSpecifier = tree.ZoneSpecifier{
       TableOrIndex: $3.tableWithIdx(),
    }
    $$.val = s
  }

var_set_list:
  var_name '=' var_value
  {
    $$.val = []tree.KVOption{tree.KVOption{Key: tree.Name(strings.Join($1.strs(), ".")), Value: $3.expr()}}
  }
| var_set_list ',' var_name '=' var_value
  {
    $$.val = append($1.kvOptions(), tree.KVOption{Key: tree.Name(strings.Join($3.strs(), ".")), Value: $5.expr()})
  }

alter_scatter_stmt:
  ALTER TABLE table_name SCATTER
  {
    $$.val = &tree.Scatter{Table: $3.newNormalizableTableNameFromUnresolvedName()}
  }
| ALTER TABLE table_name SCATTER FROM '(' expr_list ')' TO '(' expr_list ')'
  {
    $$.val = &tree.Scatter{Table: $3.newNormalizableTableNameFromUnresolvedName(), From: $7.exprs(), To: $11.exprs()}
  }

alter_scatter_index_stmt:
  ALTER INDEX table_name_with_index SCATTER
  {
    $$.val = &tree.Scatter{Index: $3.newTableWithIdx()}
  }
| ALTER INDEX table_name_with_index SCATTER FROM '(' expr_list ')' TO '(' expr_list ')'
  {
    $$.val = &tree.Scatter{Index: $3.newTableWithIdx(), From: $7.exprs(), To: $11.exprs()}
  }

alter_table_cmds:
  alter_table_cmd
  {
    $$.val = tree.AlterTableCmds{$1.alterTableCmd()}
  }
| alter_table_cmds ',' alter_table_cmd
  {
    $$.val = append($1.alterTableCmds(), $3.alterTableCmd())
  }

alter_table_cmd:

  ADD column_def
  {
    $$.val = &tree.AlterTableAddColumn{IfNotExists: false, ColumnDef: $2.colDef()}
  }

| ADD IF NOT EXISTS column_def
  {
    $$.val = &tree.AlterTableAddColumn{IfNotExists: true, ColumnDef: $5.colDef()}
  }

| ADD COLUMN column_def
  {
    $$.val = &tree.AlterTableAddColumn{IfNotExists: false, ColumnDef: $3.colDef()}
  }

| ADD COLUMN IF NOT EXISTS column_def
  {
    $$.val = &tree.AlterTableAddColumn{IfNotExists: true, ColumnDef: $6.colDef()}
  }

| ALTER opt_column column_name alter_column_default
  {
    $$.val = &tree.AlterTableSetDefault{Column: tree.Name($3), Default: $4.expr()}
  }

| ALTER opt_column column_name DROP NOT NULL
  {
    $$.val = &tree.AlterTableDropNotNull{Column: tree.Name($3)}
  }

| ALTER opt_column column_name DROP STORED
  {
    $$.val = &tree.AlterTableDropStored{Column: tree.Name($3)}
  }

| ALTER opt_column column_name SET NOT NULL { return unimplementedWithIssue(sqllex, 28751) }

| DROP opt_column IF EXISTS column_name opt_drop_behavior
  {
    $$.val = &tree.AlterTableDropColumn{
      IfExists: true,
      Column: tree.Name($5),
      DropBehavior: $6.dropBehavior(),
    }
  }

| DROP opt_column column_name opt_drop_behavior
  {
    $$.val = &tree.AlterTableDropColumn{
      IfExists: false,
      Column: tree.Name($3),
      DropBehavior: $4.dropBehavior(),
    }
  }




| ALTER opt_column column_name opt_set_data TYPE typename opt_collate opt_alter_column_using
  {
    $$.val = &tree.AlterTableAlterColumnType{
      Column: tree.Name($3),
      ToType: $6.colType(),
      Collation: $7,
      Using: $8.expr(),
    }
  }

| ADD table_constraint opt_validate_behavior
  {
    $$.val = &tree.AlterTableAddConstraint{
      ConstraintDef: $2.constraintDef(),
      ValidationBehavior: $3.validationBehavior(),
    }
  }

| ALTER CONSTRAINT constraint_name error { return unimplemented(sqllex, "alter constraint") }

| VALIDATE CONSTRAINT constraint_name
  {
    $$.val = &tree.AlterTableValidateConstraint{
      Constraint: tree.Name($3),
    }
  }

| DROP CONSTRAINT IF EXISTS constraint_name opt_drop_behavior
  {
    $$.val = &tree.AlterTableDropConstraint{
      IfExists: true,
      Constraint: tree.Name($5),
      DropBehavior: $6.dropBehavior(),
    }
  }

| DROP CONSTRAINT constraint_name opt_drop_behavior
  {
    $$.val = &tree.AlterTableDropConstraint{
      IfExists: false,
      Constraint: tree.Name($3),
      DropBehavior: $4.dropBehavior(),
    }
  }

| EXPERIMENTAL_AUDIT SET audit_mode
  {
    $$.val = &tree.AlterTableSetAudit{Mode: $3.auditMode()}
  }

| partition_by
  {
    $$.val = &tree.AlterTablePartitionBy{
      PartitionBy: $1.partitionBy(),
    }
  }

| INJECT STATISTICS a_expr
  {

    $$.val = &tree.AlterTableInjectStats{
      Stats: $3.expr(),
    }
  }

audit_mode:
  READ WRITE { $$.val = tree.AuditModeReadWrite }
| OFF        { $$.val = tree.AuditModeDisable }

alter_index_cmds:
  alter_index_cmd
  {
    $$.val = tree.AlterIndexCmds{$1.alterIndexCmd()}
  }
| alter_index_cmds ',' alter_index_cmd
  {
    $$.val = append($1.alterIndexCmds(), $3.alterIndexCmd())
  }

alter_index_cmd:
  partition_by
  {
    $$.val = &tree.AlterIndexPartitionBy{
      PartitionBy: $1.partitionBy(),
    }
  }

alter_column_default:
  SET DEFAULT a_expr
  {
    $$.val = $3.expr()
  }
| DROP DEFAULT
  {
    $$.val = nil
  }

opt_alter_column_using:
  USING a_expr
  {
     $$.val = $2.expr()
  }
|
  {
     $$.val = nil
  }


opt_drop_behavior:
  CASCADE
  {
    $$.val = tree.DropCascade
  }
| RESTRICT
  {
    $$.val = tree.DropRestrict
  }
|
  {
    $$.val = tree.DropDefault
  }

opt_validate_behavior:
  NOT VALID
  {
    $$.val = tree.ValidationSkip
  }
|
  {
    $$.val = tree.ValidationDefault
  }





















backup_stmt:
  BACKUP targets TO string_or_placeholder opt_as_of_clause opt_incremental opt_with_options
  {
    $$.val = &tree.Backup{Targets: $2.targetList(), To: $4.expr(), IncrementalFrom: $6.exprs(), AsOf: $5.asOfClause(), Options: $7.kvOptions()}
  }
| BACKUP error  { return helpWith(sqllex, "BACKUP") }




















restore_stmt:
  RESTORE targets FROM string_or_placeholder_list opt_with_options
  {
    $$.val = &tree.Restore{Targets: $2.targetList(), From: $4.exprs(), Options: $5.kvOptions()}
  }
| RESTORE targets FROM string_or_placeholder_list as_of_clause opt_with_options
  {
    $$.val = &tree.Restore{Targets: $2.targetList(), From: $4.exprs(), AsOf: $5.asOfClause(), Options: $6.kvOptions()}
  }
| RESTORE error  { return helpWith(sqllex, "RESTORE") }

import_format:
  name
  {
    $$ = strings.ToUpper($1)
  }






























import_stmt:
 IMPORT import_format '(' string_or_placeholder ')' opt_with_options
  {
    $$.val = &tree.Import{Bundle: true, FileFormat: $2, Files: tree.Exprs{$4.expr()}, Options: $6.kvOptions()}
  }
| IMPORT import_format string_or_placeholder opt_with_options
  {
    $$.val = &tree.Import{Bundle: true, FileFormat: $2, Files: tree.Exprs{$3.expr()}, Options: $4.kvOptions()}
  }
| IMPORT TABLE table_name FROM import_format '(' string_or_placeholder ')' opt_with_options
  {
    $$.val = &tree.Import{Bundle: true, Table: $3.normalizableTableNameFromUnresolvedName(), FileFormat: $5, Files: tree.Exprs{$7.expr()}, Options: $9.kvOptions()}
  }
| IMPORT TABLE table_name FROM import_format string_or_placeholder opt_with_options
  {
    $$.val = &tree.Import{Bundle: true, Table: $3.normalizableTableNameFromUnresolvedName(), FileFormat: $5, Files: tree.Exprs{$6.expr()}, Options: $7.kvOptions()}
  }
| IMPORT TABLE table_name CREATE USING string_or_placeholder import_format DATA '(' string_or_placeholder_list ')' opt_with_options
  {
    $$.val = &tree.Import{Table: $3.normalizableTableNameFromUnresolvedName(), CreateFile: $6.expr(), FileFormat: $7, Files: $10.exprs(), Options: $12.kvOptions()}
  }
| IMPORT TABLE table_name '(' table_elem_list ')' import_format DATA '(' string_or_placeholder_list ')' opt_with_options
  {
    $$.val = &tree.Import{Table: $3.normalizableTableNameFromUnresolvedName(), CreateDefs: $5.tblDefs(), FileFormat: $7, Files: $10.exprs(), Options: $12.kvOptions()}
  }
| IMPORT error  { return helpWith(sqllex, "IMPORT") }














export_stmt:
  EXPORT INTO import_format string_or_placeholder opt_with_options FROM select_stmt
  {
    $$.val = &tree.Export{Query: $7.slct(), FileFormat: $3, File: $4.expr(), Options: $5.kvOptions()}
  }
| EXPORT error  { return helpWith(sqllex, "EXPORT") }

string_or_placeholder:
  non_reserved_word_or_sconst
  {
    $$.val = tree.NewStrVal($1)
  }
| PLACEHOLDER
  {
    $$.val = tree.NewPlaceholder($1)
  }

string_or_placeholder_list:
  string_or_placeholder
  {
    $$.val = tree.Exprs{$1.expr()}
  }
| string_or_placeholder_list ',' string_or_placeholder
  {
    $$.val = append($1.exprs(), $3.expr())
  }

opt_incremental:
  INCREMENTAL FROM string_or_placeholder_list
  {
    $$.val = $3.exprs()
  }
|
  {
    $$.val = tree.Exprs(nil)
  }

kv_option:
  name '=' string_or_placeholder
  {
    $$.val = tree.KVOption{Key: tree.Name($1), Value: $3.expr()}
  }
|  name
  {
    $$.val = tree.KVOption{Key: tree.Name($1)}
  }
|  SCONST '=' string_or_placeholder
  {
    $$.val = tree.KVOption{Key: tree.Name($1), Value: $3.expr()}
  }
|  SCONST
  {
    $$.val = tree.KVOption{Key: tree.Name($1)}
  }

kv_option_list:
  kv_option
  {
    $$.val = []tree.KVOption{$1.kvOption()}
  }
|  kv_option_list ',' kv_option
  {
    $$.val = append($1.kvOptions(), $3.kvOption())
  }

opt_with_options:
  WITH kv_option_list
  {
    $$.val = $2.kvOptions()
  }
| WITH OPTIONS '(' kv_option_list ')'
  {
    $$.val = $4.kvOptions()
  }
|
  {
    $$.val = nil
  }

copy_from_stmt:
  COPY table_name opt_column_list FROM STDIN
  {
    $$.val = &tree.CopyFrom{
       Table: $2.normalizableTableNameFromUnresolvedName(),
       Columns: $3.nameList(),
       Stdin: true,
    }
  }




cancel_stmt:
  cancel_jobs_stmt      %prec VALUES |   cancel_jobs_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CANCEL JOBS") }
| cancel_queries_stmt   %prec VALUES |  cancel_queries_stmt   HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CANCEL QUERIES") }
| cancel_sessions_stmt  %prec VALUES |  cancel_sessions_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CANCEL SESSIONS") }
| CANCEL error          { return helpWith(sqllex, "CANCEL") }







cancel_jobs_stmt:
  CANCEL JOB a_expr
  {
    $$.val = &tree.ControlJobs{
      Jobs: &tree.Select{
        Select: &tree.ValuesClause{Rows: []tree.Exprs{tree.Exprs{$3.expr()}}},
      },
      Command: tree.CancelJob,
    }
  }
| CANCEL JOB error  { return helpWith(sqllex, "CANCEL JOBS") }
| CANCEL JOBS select_stmt
  {
    $$.val = &tree.ControlJobs{Jobs: $3.slct(), Command: tree.CancelJob}
  }
| CANCEL JOBS error  { return helpWith(sqllex, "CANCEL JOBS") }







cancel_queries_stmt:
  CANCEL QUERY a_expr
  {
    $$.val = &tree.CancelQueries{
      Queries: &tree.Select{
        Select: &tree.ValuesClause{Rows: []tree.Exprs{tree.Exprs{$3.expr()}}},
      },
      IfExists: false,
    }
  }
| CANCEL QUERY IF EXISTS a_expr
  {
    $$.val = &tree.CancelQueries{
      Queries: &tree.Select{
        Select: &tree.ValuesClause{Rows: []tree.Exprs{tree.Exprs{$5.expr()}}},
      },
      IfExists: true,
    }
  }
| CANCEL QUERY error  { return helpWith(sqllex, "CANCEL QUERIES") }
| CANCEL QUERIES select_stmt
  {
    $$.val = &tree.CancelQueries{Queries: $3.slct(), IfExists: false}
  }
| CANCEL QUERIES IF EXISTS select_stmt
  {
    $$.val = &tree.CancelQueries{Queries: $5.slct(), IfExists: true}
  }
| CANCEL QUERIES error  { return helpWith(sqllex, "CANCEL QUERIES") }







cancel_sessions_stmt:
  CANCEL SESSION a_expr
  {
   $$.val = &tree.CancelSessions{
      Sessions: &tree.Select{
        Select: &tree.ValuesClause{Rows: []tree.Exprs{tree.Exprs{$3.expr()}}},
      },
      IfExists: false,
    }
  }
| CANCEL SESSION IF EXISTS a_expr
  {
   $$.val = &tree.CancelSessions{
      Sessions: &tree.Select{
	    Select: &tree.ValuesClause{Rows: []tree.Exprs{tree.Exprs{$5.expr()}}},
      },
      IfExists: true,
    }
  }
| CANCEL SESSION error  { return helpWith(sqllex, "CANCEL SESSIONS") }
| CANCEL SESSIONS select_stmt
  {
    $$.val = &tree.CancelSessions{Sessions: $3.slct(), IfExists: false}
  }
| CANCEL SESSIONS IF EXISTS select_stmt
  {
    $$.val = &tree.CancelSessions{Sessions: $5.slct(), IfExists: true}
  }
| CANCEL SESSIONS error  { return helpWith(sqllex, "CANCEL SESSIONS") }

comment_stmt:
  COMMENT ON TABLE table_name IS comment_text
  {
    return unimplementedWithIssueDetail(sqllex, 19472, "table")
  }
| COMMENT ON COLUMN column_path IS comment_text
  {
    return unimplementedWithIssueDetail(sqllex, 19472, "column")
  }
| COMMENT ON error
  {
    return unimplementedWithIssue(sqllex, 19472)
  }

comment_text:
  SCONST    { $$ = $1 }
  | NULL    { $$ = "" }







create_stmt:
  create_user_stmt      %prec VALUES |   create_user_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CREATE USER") }
| create_role_stmt      %prec VALUES |  create_role_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CREATE ROLE") }
| create_ddl_stmt
| create_stats_stmt     %prec VALUES |  create_stats_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CREATE STATISTICS") }
| create_unsupported   {}
| CREATE error          { return helpWith(sqllex, "CREATE") }

create_unsupported:
  CREATE AGGREGATE error { return unimplemented(sqllex, "create aggregate") }
| CREATE CAST error { return unimplemented(sqllex, "create cast") }
| CREATE CONSTRAINT TRIGGER error { return unimplementedWithIssueDetail(sqllex, 28296, "create constraint") }
| CREATE CONVERSION error { return unimplemented(sqllex, "create conversion") }
| CREATE DEFAULT CONVERSION error { return unimplemented(sqllex, "create def conv") }
| CREATE EXTENSION IF NOT EXISTS name error { return unimplemented(sqllex, "create extension " + $6) }
| CREATE EXTENSION name error { return unimplemented(sqllex, "create extension " + $3) }
| CREATE FOREIGN TABLE error { return unimplemented(sqllex, "create foreign table") }
| CREATE FOREIGN DATA error { return unimplemented(sqllex, "create fdw") }
| CREATE FUNCTION error { return unimplementedWithIssueDetail(sqllex, 17511, "create function") }
| CREATE OR REPLACE FUNCTION error { return unimplementedWithIssueDetail(sqllex, 17511, "create function") }
| CREATE opt_or_replace opt_trusted opt_procedural LANGUAGE name error { return unimplementedWithIssueDetail(sqllex, 17511, "create language " + $6) }
| CREATE MATERIALIZED VIEW error { return unimplementedWithIssue(sqllex, 24747) }
| CREATE OPERATOR error { return unimplemented(sqllex, "create operator") }
| CREATE PUBLICATION error { return unimplemented(sqllex, "create publication") }
| CREATE opt_or_replace RULE error { return unimplemented(sqllex, "create rule") }
| CREATE SERVER error { return unimplemented(sqllex, "create server") }
| CREATE SUBSCRIPTION error { return unimplemented(sqllex, "create subscription") }
| CREATE TEXT error { return unimplementedWithIssueDetail(sqllex, 7821, "create text") }
| CREATE TRIGGER error { return unimplementedWithIssueDetail(sqllex, 28296, "create") }

opt_or_replace:
  OR REPLACE {}
|   {}

opt_trusted:
  TRUSTED {}
|   {}

opt_procedural:
  PROCEDURAL {}
|   {}

drop_unsupported:
  DROP AGGREGATE error { return unimplemented(sqllex, "drop aggregate") }
| DROP CAST error { return unimplemented(sqllex, "drop cast") }
| DROP COLLATION error { return unimplemented(sqllex, "drop collation") }
| DROP CONVERSION error { return unimplemented(sqllex, "drop conversion") }
| DROP DOMAIN error { return unimplementedWithIssueDetail(sqllex, 27796, "drop") }
| DROP EXTENSION IF EXISTS name error { return unimplemented(sqllex, "drop extension " + $5) }
| DROP EXTENSION name error { return unimplemented(sqllex, "drop extension " + $3) }
| DROP FOREIGN TABLE error { return unimplemented(sqllex, "drop foreign table") }
| DROP FOREIGN DATA error { return unimplemented(sqllex, "drop fdw") }
| DROP FUNCTION error { return unimplementedWithIssueDetail(sqllex, 17511, "drop function") }
| DROP opt_procedural LANGUAGE name error { return unimplementedWithIssueDetail(sqllex, 17511, "drop language " + $4) }
| DROP OPERATOR error { return unimplemented(sqllex, "drop operator") }
| DROP PUBLICATION error { return unimplemented(sqllex, "drop publication") }
| DROP RULE error { return unimplemented(sqllex, "drop rule") }
| DROP SERVER error { return unimplemented(sqllex, "drop server") }
| DROP SUBSCRIPTION error { return unimplemented(sqllex, "drop subscription") }
| DROP TEXT error { return unimplementedWithIssueDetail(sqllex, 7821, "drop text") }
| DROP TYPE error { return unimplementedWithIssueDetail(sqllex, 27793, "drop type") }
| DROP TRIGGER error { return unimplementedWithIssueDetail(sqllex, 28296, "drop") }

create_ddl_stmt:
  create_changefeed_stmt
| create_database_stmt  %prec VALUES |  create_database_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CREATE DATABASE") }
| create_index_stmt     %prec VALUES |  create_index_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CREATE INDEX") }
| create_table_stmt     %prec VALUES |  create_table_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CREATE TABLE") }
| create_table_as_stmt  %prec VALUES |  create_table_as_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CREATE TABLE") }

| CREATE opt_temp TABLE error    { return helpWith(sqllex, "CREATE TABLE") }
| create_type_stmt     {   }
| create_view_stmt      %prec VALUES |  create_view_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CREATE VIEW") }
| create_sequence_stmt  %prec VALUES |  create_sequence_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "CREATE SEQUENCE") }







create_stats_stmt:
  CREATE STATISTICS statistics_name ON name_list FROM table_name
  {

    $$.val = &tree.CreateStats{
      Name: tree.Name($3),
      ColumnNames: $5.nameList(),
      Table: $7.normalizableTableNameFromUnresolvedName(),
    }
  }
| CREATE STATISTICS error  { return helpWith(sqllex, "CREATE STATISTICS") }

create_changefeed_stmt:
  CREATE CHANGEFEED FOR changefeed_targets opt_changefeed_sink opt_with_options
  {
    $$.val = &tree.CreateChangefeed{
      Targets: $4.targetList(),
      SinkURI: $5.expr(),
      Options: $6.kvOptions(),
    }
  }

changefeed_targets:
  single_table_pattern_list
  {
    $$.val = tree.TargetList{Tables: $1.tablePatterns()}
  }
| TABLE single_table_pattern_list
  {
    $$.val = tree.TargetList{Tables: $2.tablePatterns()}
  }

single_table_pattern_list:
  table_name
  {
    $$.val = tree.TablePatterns{$1.unresolvedName()}
  }
| single_table_pattern_list ',' table_name
  {
    $$.val = append($1.tablePatterns(), $3.unresolvedName())
  }


opt_changefeed_sink:
  INTO string_or_placeholder
  {
    $$.val = $2.expr()
  }
|
  {

    $$.val = nil
  }








delete_stmt:
  opt_with_clause DELETE FROM table_name_expr_opt_alias_idx where_clause opt_sort_clause opt_limit_clause returning_clause
  {
    $$.val = &tree.Delete{
      With: $1.with(),
      Table: $4.tblExpr(),
      Where: tree.NewWhere(tree.AstWhere, $5.expr()),
      OrderBy: $6.orderBy(),
      Limit: $7.limit(),
      Returning: $8.retClause(),
    }
  }
| opt_with_clause DELETE error  { return helpWith(sqllex, "DELETE") }




discard_stmt:
  DISCARD ALL
  {
    $$.val = &tree.Discard{Mode: tree.DiscardModeAll}
  }
| DISCARD PLANS { return unimplemented(sqllex, "discard plans") }
| DISCARD SEQUENCES { return unimplemented(sqllex, "discard sequences") }
| DISCARD TEMP { return unimplemented(sqllex, "discard temp") }
| DISCARD TEMPORARY { return unimplemented(sqllex, "discard temp") }
| DISCARD error  { return helpWith(sqllex, "DISCARD") }






drop_stmt:
  drop_ddl_stmt
| drop_role_stmt      %prec VALUES |  drop_role_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DROP ROLE") }
| drop_user_stmt      %prec VALUES |  drop_user_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DROP USER") }
| drop_unsupported   {}
| DROP error          { return helpWith(sqllex, "DROP") }

drop_ddl_stmt:
  drop_database_stmt  %prec VALUES |   drop_database_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DROP DATABASE") }
| drop_index_stmt     %prec VALUES |  drop_index_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DROP INDEX") }
| drop_table_stmt     %prec VALUES |  drop_table_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DROP TABLE") }
| drop_view_stmt      %prec VALUES |  drop_view_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DROP VIEW") }
| drop_sequence_stmt  %prec VALUES |  drop_sequence_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DROP SEQUENCE") }





drop_view_stmt:
  DROP VIEW table_name_list opt_drop_behavior
  {
    $$.val = &tree.DropView{Names: $3.normalizableTableNames(), IfExists: false, DropBehavior: $4.dropBehavior()}
  }
| DROP VIEW IF EXISTS table_name_list opt_drop_behavior
  {
    $$.val = &tree.DropView{Names: $5.normalizableTableNames(), IfExists: true, DropBehavior: $6.dropBehavior()}
  }
| DROP VIEW error  { return helpWith(sqllex, "DROP VIEW") }





drop_sequence_stmt:
  DROP SEQUENCE table_name_list opt_drop_behavior
  {
    $$.val = &tree.DropSequence{Names: $3.normalizableTableNames(), IfExists: false, DropBehavior: $4.dropBehavior()}
  }
| DROP SEQUENCE IF EXISTS table_name_list opt_drop_behavior
  {
    $$.val = &tree.DropSequence{Names: $5.normalizableTableNames(), IfExists: true, DropBehavior: $6.dropBehavior()}
  }
| DROP SEQUENCE error  { return helpWith(sqllex, "DROP VIEW") }





drop_table_stmt:
  DROP TABLE table_name_list opt_drop_behavior
  {
    $$.val = &tree.DropTable{Names: $3.normalizableTableNames(), IfExists: false, DropBehavior: $4.dropBehavior()}
  }
| DROP TABLE IF EXISTS table_name_list opt_drop_behavior
  {
    $$.val = &tree.DropTable{Names: $5.normalizableTableNames(), IfExists: true, DropBehavior: $6.dropBehavior()}
  }
| DROP TABLE error  { return helpWith(sqllex, "DROP TABLE") }





drop_index_stmt:
  DROP INDEX table_name_with_index_list opt_drop_behavior
  {
    $$.val = &tree.DropIndex{
      IndexList: $3.newTableWithIdxList(),
      IfExists: false,
      DropBehavior: $4.dropBehavior(),
    }
  }
| DROP INDEX IF EXISTS table_name_with_index_list opt_drop_behavior
  {
    $$.val = &tree.DropIndex{
      IndexList: $5.newTableWithIdxList(),
      IfExists: true,
      DropBehavior: $6.dropBehavior(),
    }
  }
| DROP INDEX error  { return helpWith(sqllex, "DROP INDEX") }





drop_database_stmt:
  DROP DATABASE database_name opt_drop_behavior
  {
    $$.val = &tree.DropDatabase{
      Name: tree.Name($3),
      IfExists: false,
      DropBehavior: $4.dropBehavior(),
    }
  }
| DROP DATABASE IF EXISTS database_name opt_drop_behavior
  {
    $$.val = &tree.DropDatabase{
      Name: tree.Name($5),
      IfExists: true,
      DropBehavior: $6.dropBehavior(),
    }
  }
| DROP DATABASE error  { return helpWith(sqllex, "DROP DATABASE") }





drop_user_stmt:
  DROP USER string_or_placeholder_list
  {
    $$.val = &tree.DropUser{Names: $3.exprs(), IfExists: false}
  }
| DROP USER IF EXISTS string_or_placeholder_list
  {
    $$.val = &tree.DropUser{Names: $5.exprs(), IfExists: true}
  }
| DROP USER error  { return helpWith(sqllex, "DROP USER") }





drop_role_stmt:
  DROP ROLE string_or_placeholder_list
  {
    $$.val = &tree.DropRole{Names: $3.exprs(), IfExists: false}
  }
| DROP ROLE IF EXISTS string_or_placeholder_list
  {
    $$.val = &tree.DropRole{Names: $5.exprs(), IfExists: true}
  }
| DROP ROLE error  { return helpWith(sqllex, "DROP ROLE") }

table_name_list:
  table_name
  {
    $$.val = tree.NormalizableTableNames{$1.normalizableTableNameFromUnresolvedName()}
  }
| table_name_list ',' table_name
  {
    $$.val = append($1.normalizableTableNames(), $3.normalizableTableNameFromUnresolvedName())
  }

















explain_stmt:
  EXPLAIN preparable_stmt
  {
    $$.val = &tree.Explain{Statement: $2.stmt()}
  }
| EXPLAIN error  { return helpWith(sqllex, "EXPLAIN") }
| EXPLAIN '(' explain_option_list ')' preparable_stmt
  {
    $$.val = &tree.Explain{Options: $3.strs(), Statement: $5.stmt()}
  }
| EXPLAIN ANALYZE preparable_stmt
  {
    $$.val = &tree.Explain{Options: []string{"DISTSQL", $2}, Statement: $3.stmt()}
  }
| EXPLAIN ANALYZE '(' explain_option_list ')' preparable_stmt
  {
    $$.val = &tree.Explain{Options: append($4.strs(), $2), Statement: $6.stmt()}
  }




| EXPLAIN '(' error  { return helpWith(sqllex, "EXPLAIN") }

preparable_stmt:
  alter_stmt
| backup_stmt        %prec VALUES |  backup_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "BACKUP") }
| cancel_stmt
| create_stmt
| delete_stmt        %prec VALUES |  delete_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "DELETE") }
| drop_stmt
| explain_stmt      {   }
| import_stmt        %prec VALUES |  import_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "IMPORT") }
| insert_stmt        %prec VALUES |  insert_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "INSERT") }
| pause_stmt         %prec VALUES |  pause_stmt         HELPTOKEN %prec UMINUS { return helpWith(sqllex, "PAUSE JOBS") }
| reset_stmt
| restore_stmt       %prec VALUES |  restore_stmt       HELPTOKEN %prec UMINUS { return helpWith(sqllex, "RESTORE") }
| resume_stmt        %prec VALUES |  resume_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "RESUME JOBS") }
| scrub_stmt
| select_stmt
  {
    $$.val = $1.slct()
  }
| preparable_set_stmt
| show_stmt
| truncate_stmt      %prec VALUES |  truncate_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "TRUNCATE") }
| update_stmt        %prec VALUES |  update_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "UPDATE") }
| upsert_stmt        %prec VALUES |  upsert_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "UPSERT") }

explain_option_list:
  explain_option_name
  {
    $$.val = []string{$1}
  }
| explain_option_list ',' explain_option_name
  {
    $$.val = append($1.strs(), $3)
  }





prepare_stmt:
  PREPARE table_alias_name prep_type_clause AS preparable_stmt
  {
    $$.val = &tree.Prepare{
      Name: tree.Name($2),
      Types: $3.colTypes(),
      Statement: $5.stmt(),
    }
  }
| PREPARE error  { return helpWith(sqllex, "PREPARE") }

prep_type_clause:
  '(' type_list ')'
  {
    $$.val = $2.colTypes();
  }
|
  {
    $$.val = []coltypes.T(nil)
  }





execute_stmt:
  EXECUTE table_alias_name execute_param_clause
  {
    $$.val = &tree.Execute{
      Name: tree.Name($2),
      Params: $3.exprs(),
    }
  }
| EXECUTE error  { return helpWith(sqllex, "EXECUTE") }

execute_param_clause:
  '(' expr_list ')'
  {
    $$.val = $2.exprs()
  }
|
  {
    $$.val = tree.Exprs(nil)
  }





deallocate_stmt:
  DEALLOCATE name
  {
    $$.val = &tree.Deallocate{Name: tree.Name($2)}
  }
| DEALLOCATE PREPARE name
  {
    $$.val = &tree.Deallocate{Name: tree.Name($3)}
  }
| DEALLOCATE ALL
  {
    $$.val = &tree.Deallocate{}
  }
| DEALLOCATE PREPARE ALL
  {
    $$.val = &tree.Deallocate{}
  }
| DEALLOCATE error  { return helpWith(sqllex, "DEALLOCATE") }

















grant_stmt:
  GRANT privileges ON targets TO name_list
  {
    $$.val = &tree.Grant{Privileges: $2.privilegeList(), Grantees: $6.nameList(), Targets: $4.targetList()}
  }
| GRANT privilege_list TO name_list
  {
    $$.val = &tree.GrantRole{Roles: $2.nameList(), Members: $4.nameList(), AdminOption: false}
  }
| GRANT privilege_list TO name_list WITH ADMIN OPTION
  {
    $$.val = &tree.GrantRole{Roles: $2.nameList(), Members: $4.nameList(), AdminOption: true}
  }
| GRANT error  { return helpWith(sqllex, "GRANT") }

















revoke_stmt:
  REVOKE privileges ON targets FROM name_list
  {
    $$.val = &tree.Revoke{Privileges: $2.privilegeList(), Grantees: $6.nameList(), Targets: $4.targetList()}
  }
| REVOKE privilege_list FROM name_list
  {
    $$.val = &tree.RevokeRole{Roles: $2.nameList(), Members: $4.nameList(), AdminOption: false }
  }
| REVOKE ADMIN OPTION FOR privilege_list FROM name_list
  {
    $$.val = &tree.RevokeRole{Roles: $5.nameList(), Members: $7.nameList(), AdminOption: true }
  }
| REVOKE error  { return helpWith(sqllex, "REVOKE") }


privileges:
  ALL
  {
    $$.val = privilege.List{privilege.ALL}
  }
  | privilege_list
  {
     privList, err := privilege.ListFromStrings($1.nameList().ToStrings())
     if err != nil {
       sqllex.Error(err.Error())
       return 1
     }
     $$.val = privList
  }

privilege_list:
  privilege
  {
    $$.val = tree.NameList{tree.Name($1)}
  }
| privilege_list ',' privilege
  {
    $$.val = append($1.nameList(), tree.Name($3))
  }




privilege:
  name
| CREATE
| GRANT
| SELECT

reset_stmt:
  reset_session_stmt   %prec VALUES |   reset_session_stmt   HELPTOKEN %prec UMINUS { return helpWith(sqllex, "RESET") }
| reset_csetting_stmt  %prec VALUES |  reset_csetting_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "RESET CLUSTER SETTING") }





reset_session_stmt:
  RESET session_var
  {
    $$.val = &tree.SetVar{Name: $2, Values:tree.Exprs{tree.DefaultVal{}}}
  }
| RESET SESSION session_var
  {
    $$.val = &tree.SetVar{Name: $3, Values:tree.Exprs{tree.DefaultVal{}}}
  }
| RESET error  { return helpWith(sqllex, "RESET") }





reset_csetting_stmt:
  RESET CLUSTER SETTING var_name
  {
    $$.val = &tree.SetClusterSetting{Name: strings.Join($4.strs(), "."), Value:tree.DefaultVal{}}
  }
| RESET CLUSTER error  { return helpWith(sqllex, "RESET CLUSTER SETTING") }








use_stmt:
  USE var_value
  {
    $$.val = &tree.SetVar{Name: "database", Values: tree.Exprs{$2.expr()}}
  }
| USE error  { return helpWith(sqllex, "USE") }


nonpreparable_set_stmt:
  set_transaction_stmt  %prec VALUES |   set_transaction_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SET TRANSACTION") }
| set_exprs_internal   {   }
| SET CONSTRAINTS error { return unimplemented(sqllex, "set constraints") }
| SET LOCAL error { return unimplemented(sqllex, "set local") }


preparable_set_stmt:
  set_session_stmt      %prec VALUES |   set_session_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SET SESSION") }
| set_csetting_stmt     %prec VALUES |  set_csetting_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SET CLUSTER SETTING") }
| use_stmt              %prec VALUES |  use_stmt              HELPTOKEN %prec UMINUS { return helpWith(sqllex, "USE") }












scrub_stmt:
  scrub_table_stmt
| scrub_database_stmt
| EXPERIMENTAL SCRUB error  { return helpWith(sqllex, "SCRUB") }












scrub_database_stmt:
  EXPERIMENTAL SCRUB DATABASE database_name opt_as_of_clause
  {
    $$.val = &tree.Scrub{Typ: tree.ScrubDatabase, Database: tree.Name($4), AsOf: $5.asOfClause()}
  }
| EXPERIMENTAL SCRUB DATABASE error  { return helpWith(sqllex, "SCRUB DATABASE") }















scrub_table_stmt:
  EXPERIMENTAL SCRUB TABLE table_name opt_as_of_clause opt_scrub_options_clause
  {
    $$.val = &tree.Scrub{
        Typ: tree.ScrubTable,
        Table: $4.normalizableTableNameFromUnresolvedName(),
        AsOf: $5.asOfClause(),
        Options: $6.scrubOptions(),
    }
  }
| EXPERIMENTAL SCRUB TABLE error  { return helpWith(sqllex, "SCRUB TABLE") }

opt_scrub_options_clause:
  WITH OPTIONS scrub_option_list
  {
    $$.val = $3.scrubOptions()
  }
|
  {
    $$.val = tree.ScrubOptions{}
  }

scrub_option_list:
  scrub_option
  {
    $$.val = tree.ScrubOptions{$1.scrubOption()}
  }
| scrub_option_list ',' scrub_option
  {
    $$.val = append($1.scrubOptions(), $3.scrubOption())
  }

scrub_option:
  INDEX ALL
  {
    $$.val = &tree.ScrubOptionIndex{}
  }
| INDEX '(' name_list ')'
  {
    $$.val = &tree.ScrubOptionIndex{IndexNames: $3.nameList()}
  }
| CONSTRAINT ALL
  {
    $$.val = &tree.ScrubOptionConstraint{}
  }
| CONSTRAINT '(' name_list ')'
  {
    $$.val = &tree.ScrubOptionConstraint{ConstraintNames: $3.nameList()}
  }
| PHYSICAL
  {
    $$.val = &tree.ScrubOptionPhysical{}
  }






set_csetting_stmt:
  SET CLUSTER SETTING var_name to_or_eq var_value
  {
    $$.val = &tree.SetClusterSetting{Name: strings.Join($4.strs(), "."), Value: $6.expr()}
  }
| SET CLUSTER error  { return helpWith(sqllex, "SET CLUSTER SETTING") }

to_or_eq:
  '='
| TO

set_exprs_internal:
  /* SET ROW serves to accelerate parser.parseExprs().
     It cannot be used by clients. */
  SET ROW '(' expr_list ')'
  {
    $$.val = &tree.SetVar{Values: $4.exprs()}
  }











set_session_stmt:
  SET SESSION set_rest_more
  {
    $$.val = $3.stmt()
  }
| SET set_rest_more
  {
    $$.val = $2.stmt()
  }

| SET SESSION CHARACTERISTICS AS TRANSACTION transaction_mode_list
  {
    $$.val = &tree.SetSessionCharacteristics{Modes: $6.transactionModes()}
  }












set_transaction_stmt:
  SET TRANSACTION transaction_mode_list
  {
    $$.val = &tree.SetTransaction{Modes: $3.transactionModes()}
  }
| SET TRANSACTION error  { return helpWith(sqllex, "SET TRANSACTION") }
| SET SESSION TRANSACTION transaction_mode_list
  {
    $$.val = &tree.SetTransaction{Modes: $4.transactionModes()}
  }
| SET SESSION TRANSACTION error  { return helpWith(sqllex, "SET TRANSACTION") }

generic_set:
  var_name to_or_eq var_list
  {


    varName := $1.strs()
    if len(varName) == 1 && varName[0] == "tracing" {
      $$.val = &tree.SetTracing{Values: $3.exprs()}
    } else {
      $$.val = &tree.SetVar{Name: strings.Join($1.strs(), "."), Values: $3.exprs()}
    }
  }

set_rest_more:

   generic_set




| TIME ZONE zone_value
  {

    $$.val = &tree.SetVar{Name: "timezone", Values: tree.Exprs{$3.expr()}}
  }


| SCHEMA var_value
  {

    $$.val = &tree.SetVar{Name: "search_path", Values: tree.Exprs{$2.expr()}}
  }

| set_names
| var_name FROM CURRENT { return unimplemented(sqllex, "set from current") }
| error  { return helpWith(sqllex, "SET SESSION") }





set_names:
  NAMES var_value
  {

    $$.val = &tree.SetVar{Name: "client_encoding", Values: tree.Exprs{$2.expr()}}
  }
| NAMES
  {

    $$.val = &tree.SetVar{Name: "client_encoding", Values: tree.Exprs{tree.DefaultVal{}}}
  }

var_name:
  name
  {
    $$.val = []string{$1}
  }
| name attrs
  {
    $$.val = append([]string{$1}, $2.strs()...)
  }

attrs:
  '.' unrestricted_name
  {
    $$.val = []string{$2}
  }
| attrs '.' unrestricted_name
  {
    $$.val = append($1.strs(), $3)
  }

var_value:
  a_expr
| ON
  {
    $$.val = tree.Expr(&tree.UnresolvedName{NumParts: 1, Parts: tree.NameParts{$1}})
  }

var_list:
  var_value
  {
    $$.val = tree.Exprs{$1.expr()}
  }
| var_list ',' var_value
  {
    $$.val = append($1.exprs(), $3.expr())
  }

iso_level:
  READ UNCOMMITTED
  {
    $$.val = tree.SerializableIsolation
  }
| READ COMMITTED
  {
    $$.val = tree.SerializableIsolation
  }
| SNAPSHOT
  {
    $$.val = tree.SerializableIsolation
  }
| REPEATABLE READ
  {
    $$.val = tree.SerializableIsolation
  }
| SERIALIZABLE
  {
    $$.val = tree.SerializableIsolation
  }

user_priority:
  LOW
  {
    $$.val = tree.Low
  }
| NORMAL
  {
    $$.val = tree.Normal
  }
| HIGH
  {
    $$.val = tree.High
  }






zone_value:
  SCONST
  {
    $$.val = tree.NewStrVal($1)
  }
| IDENT
  {
    $$.val = tree.NewStrVal($1)
  }
| interval
  {
    $$.val = $1.expr()
  }
| numeric_only
| DEFAULT
  {
    $$.val = tree.DefaultVal{}
  }
| LOCAL
  {
    $$.val = tree.NewStrVal($1)
  }








show_stmt:
  show_backup_stmt           %prec VALUES |   show_backup_stmt           HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW BACKUP") }
| show_columns_stmt          %prec VALUES |  show_columns_stmt          HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW COLUMNS") }
| show_constraints_stmt      %prec VALUES |  show_constraints_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW CONSTRAINTS") }
| show_create_stmt           %prec VALUES |  show_create_stmt           HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW CREATE") }
| show_csettings_stmt        %prec VALUES |  show_csettings_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW CLUSTER SETTING") }
| show_databases_stmt        %prec VALUES |  show_databases_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW DATABASES") }
| show_fingerprints_stmt
| show_grants_stmt           %prec VALUES |  show_grants_stmt           HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW GRANTS") }
| show_histogram_stmt        %prec VALUES |  show_histogram_stmt        HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW HISTOGRAM") }
| show_indexes_stmt          %prec VALUES |  show_indexes_stmt          HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW INDEXES") }
| show_jobs_stmt             %prec VALUES |  show_jobs_stmt             HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW JOBS") }
| show_queries_stmt          %prec VALUES |  show_queries_stmt          HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW QUERIES") }
| show_ranges_stmt           %prec VALUES |  show_ranges_stmt           HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW RANGES") }
| show_roles_stmt            %prec VALUES |  show_roles_stmt            HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW ROLES") }
| show_schemas_stmt          %prec VALUES |  show_schemas_stmt          HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW SCHEMAS") }
| show_session_stmt          %prec VALUES |  show_session_stmt          HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW SESSION") }
| show_sessions_stmt         %prec VALUES |  show_sessions_stmt         HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW SESSIONS") }
| show_stats_stmt            %prec VALUES |  show_stats_stmt            HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW STATISTICS") }
| show_syntax_stmt           %prec VALUES |  show_syntax_stmt           HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW SYNTAX") }
| show_tables_stmt           %prec VALUES |  show_tables_stmt           HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW TABLES") }
| show_trace_stmt            %prec VALUES |  show_trace_stmt            HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW TRACE") }
| show_transaction_stmt      %prec VALUES |  show_transaction_stmt      HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW TRANSACTION") }
| show_users_stmt            %prec VALUES |  show_users_stmt            HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SHOW USERS") }
| show_zone_stmt
| SHOW error                 { return helpWith(sqllex, "SHOW") }





show_session_stmt:
  SHOW session_var         { $$.val = &tree.ShowVar{Name: $2} }
| SHOW SESSION session_var { $$.val = &tree.ShowVar{Name: $3} }
| SHOW SESSION error  { return helpWith(sqllex, "SHOW SESSION") }

session_var:
  IDENT



| ALL
| DATABASE


| NAMES { $$ = "client_encoding" }
| SESSION_USER

| TIME ZONE { $$ = "timezone" }
| TIME error  { return helpWith(sqllex, "SHOW SESSION") }











show_stats_stmt:
  SHOW STATISTICS FOR TABLE table_name
  {

    $$.val = &tree.ShowTableStats{Table: $5.normalizableTableNameFromUnresolvedName() }
  }
| SHOW STATISTICS USING JSON FOR TABLE table_name
  {

    $$.val = &tree.ShowTableStats{Table: $7.normalizableTableNameFromUnresolvedName(), UsingJSON: true}
  }
| SHOW STATISTICS error  { return helpWith(sqllex, "SHOW STATISTICS") }








show_histogram_stmt:
  SHOW HISTOGRAM ICONST
  {

    id, err := $3.numVal().AsInt64()
    if err != nil {
      sqllex.Error(err.Error())
      return 1
    }
    $$.val = &tree.ShowHistogram{HistogramID: id}
  }
| SHOW HISTOGRAM error  { return helpWith(sqllex, "SHOW HISTOGRAM") }





show_backup_stmt:
  SHOW BACKUP string_or_placeholder
  {
    $$.val = &tree.ShowBackup{
      Details: tree.BackupDefaultDetails,
      Path:    $3.expr(),
    }
  }
| SHOW BACKUP RANGES string_or_placeholder
  {

    $$.val = &tree.ShowBackup{
      Details: tree.BackupRangeDetails,
      Path:    $4.expr(),
    }
  }
| SHOW BACKUP FILES string_or_placeholder
  {

    $$.val = &tree.ShowBackup{
      Details: tree.BackupFileDetails,
      Path:    $4.expr(),
    }
  }
| SHOW BACKUP error  { return helpWith(sqllex, "SHOW BACKUP") }







show_csettings_stmt:
  SHOW CLUSTER SETTING var_name
  {
    $$.val = &tree.ShowClusterSetting{Name: strings.Join($4.strs(), ".")}
  }
| SHOW CLUSTER SETTING ALL
  {
    $$.val = &tree.ShowClusterSetting{Name: "all"}
  }
| SHOW CLUSTER error  { return helpWith(sqllex, "SHOW CLUSTER SETTING") }
| SHOW ALL CLUSTER SETTINGS
  {
    $$.val = &tree.ShowClusterSetting{Name: "all"}
  }
| SHOW ALL CLUSTER error  { return helpWith(sqllex, "SHOW CLUSTER SETTING") }





show_columns_stmt:
  SHOW COLUMNS FROM table_name
  {
     $$.val = &tree.ShowColumns{Table: $4.normalizableTableNameFromUnresolvedName()}
  }
| SHOW COLUMNS error  { return helpWith(sqllex, "SHOW COLUMNS") }





show_databases_stmt:
  SHOW DATABASES
  {
    $$.val = &tree.ShowDatabases{}
  }
| SHOW DATABASES error  { return helpWith(sqllex, "SHOW DATABASES") }










show_grants_stmt:
  SHOW GRANTS opt_on_targets_roles for_grantee_clause
  {
    lst := $3.targetListPtr()
    if lst != nil && lst.ForRoles {
      $$.val = &tree.ShowRoleGrants{Roles: lst.Roles, Grantees: $4.nameList()}
    } else {
      $$.val = &tree.ShowGrants{Targets: lst, Grantees: $4.nameList()}
    }
  }
| SHOW GRANTS error  { return helpWith(sqllex, "SHOW GRANTS") }





show_indexes_stmt:
  SHOW INDEX FROM table_name
  {
    $$.val = &tree.ShowIndex{Table: $4.normalizableTableNameFromUnresolvedName()}
  }
| SHOW INDEX error  { return helpWith(sqllex, "SHOW INDEXES") }
| SHOW INDEXES FROM table_name
  {
    $$.val = &tree.ShowIndex{Table: $4.normalizableTableNameFromUnresolvedName()}
  }
| SHOW INDEXES error  { return helpWith(sqllex, "SHOW INDEXES") }
| SHOW KEYS FROM table_name
  {
    $$.val = &tree.ShowIndex{Table: $4.normalizableTableNameFromUnresolvedName()}
  }
| SHOW KEYS error  { return helpWith(sqllex, "SHOW INDEXES") }





show_constraints_stmt:
  SHOW CONSTRAINT FROM table_name
  {
    $$.val = &tree.ShowConstraints{Table: $4.normalizableTableNameFromUnresolvedName()}
  }
| SHOW CONSTRAINT error  { return helpWith(sqllex, "SHOW CONSTRAINTS") }
| SHOW CONSTRAINTS FROM table_name
  {
    $$.val = &tree.ShowConstraints{Table: $4.normalizableTableNameFromUnresolvedName()}
  }
| SHOW CONSTRAINTS error  { return helpWith(sqllex, "SHOW CONSTRAINTS") }





show_queries_stmt:
  SHOW QUERIES
  {
    $$.val = &tree.ShowQueries{Cluster: true}
  }
| SHOW QUERIES error  { return helpWith(sqllex, "SHOW QUERIES") }
| SHOW CLUSTER QUERIES
  {
    $$.val = &tree.ShowQueries{Cluster: true}
  }
| SHOW LOCAL QUERIES
  {
    $$.val = &tree.ShowQueries{Cluster: false}
  }





show_jobs_stmt:
  SHOW JOBS
  {
    $$.val = &tree.ShowJobs{}
  }
| SHOW JOBS error  { return helpWith(sqllex, "SHOW JOBS") }






show_trace_stmt:
  SHOW opt_compact TRACE FOR SESSION
  {
    $$.val = &tree.ShowTraceForSession{TraceType: tree.ShowTraceRaw, Compact: $2.bool()}
  }
| SHOW opt_compact TRACE error  { return helpWith(sqllex, "SHOW TRACE") }
| SHOW opt_compact KV TRACE FOR SESSION
  {
    $$.val = &tree.ShowTraceForSession{TraceType: tree.ShowTraceKV, Compact: $2.bool()}
  }
| SHOW opt_compact KV error  { return helpWith(sqllex, "SHOW TRACE") }
| SHOW opt_compact EXPERIMENTAL_REPLICA TRACE FOR SESSION
  {

    $$.val = &tree.ShowTraceForSession{TraceType: tree.ShowTraceReplica, Compact: $2.bool()}
  }
| SHOW opt_compact EXPERIMENTAL_REPLICA error  { return helpWith(sqllex, "SHOW TRACE") }

opt_compact:
  COMPACT { $$.val = true }
|   { $$.val = false }





show_sessions_stmt:
  SHOW SESSIONS
  {
    $$.val = &tree.ShowSessions{Cluster: true}
  }
| SHOW SESSIONS error  { return helpWith(sqllex, "SHOW SESSIONS") }
| SHOW CLUSTER SESSIONS
  {
    $$.val = &tree.ShowSessions{Cluster: true}
  }
| SHOW LOCAL SESSIONS
  {
    $$.val = &tree.ShowSessions{Cluster: false}
  }





show_tables_stmt:
  SHOW TABLES FROM name '.' name
  {
    $$.val = &tree.ShowTables{TableNamePrefix:tree.TableNamePrefix{
        CatalogName: tree.Name($4),
        ExplicitCatalog: true,
        SchemaName: tree.Name($6),
        ExplicitSchema: true,
    }}
  }
| SHOW TABLES FROM name
  {
    $$.val = &tree.ShowTables{TableNamePrefix:tree.TableNamePrefix{


        SchemaName: tree.Name($4),
        ExplicitSchema: true,
    }}
  }
| SHOW TABLES
  {
    $$.val = &tree.ShowTables{}
  }
| SHOW TABLES error  { return helpWith(sqllex, "SHOW TABLES") }




show_schemas_stmt:
  SHOW SCHEMAS FROM name
  {
    $$.val = &tree.ShowSchemas{Database: tree.Name($4)}
  }
| SHOW SCHEMAS
  {
    $$.val = &tree.ShowSchemas{}
  }
| SHOW SCHEMAS error  { return helpWith(sqllex, "SHOW SCHEMAS") }




show_syntax_stmt:
  SHOW SYNTAX SCONST
  {

    $$.val = &tree.ShowSyntax{Statement: $3}
  }
| SHOW SYNTAX error  { return helpWith(sqllex, "SHOW SYNTAX") }





show_transaction_stmt:
  SHOW TRANSACTION ISOLATION LEVEL
  {

    $$.val = &tree.ShowVar{Name: "transaction_isolation"}
  }
| SHOW TRANSACTION PRIORITY
  {

    $$.val = &tree.ShowVar{Name: "transaction_priority"}
  }
| SHOW TRANSACTION STATUS
  {

    $$.val = &tree.ShowTransactionStatus{}
  }
| SHOW TRANSACTION error  { return helpWith(sqllex, "SHOW TRANSACTION") }





show_create_stmt:
  SHOW CREATE table_name
  {
    $$.val = &tree.ShowCreate{Name: $3.normalizableTableNameFromUnresolvedName()}
  }
| SHOW CREATE create_kw table_name
  {

    $$.val = &tree.ShowCreate{Name: $4.normalizableTableNameFromUnresolvedName()}
  }
| SHOW CREATE error  { return helpWith(sqllex, "SHOW CREATE") }

create_kw:
  TABLE
| VIEW
| SEQUENCE





show_users_stmt:
  SHOW USERS
  {
    $$.val = &tree.ShowUsers{}
  }
| SHOW USERS error  { return helpWith(sqllex, "SHOW USERS") }





show_roles_stmt:
  SHOW ROLES
  {
    $$.val = &tree.ShowRoles{}
  }
| SHOW ROLES error  { return helpWith(sqllex, "SHOW ROLES") }

show_zone_stmt:
  SHOW ZONE CONFIGURATION FOR RANGE zone_name
  {
    $$.val = &tree.ShowZoneConfig{ZoneSpecifier: tree.ZoneSpecifier{NamedZone: tree.UnrestrictedName($6)}}
  }
| SHOW ZONE CONFIGURATION FOR DATABASE database_name
  {
    $$.val = &tree.ShowZoneConfig{ZoneSpecifier: tree.ZoneSpecifier{Database: tree.Name($6)}}
  }
| SHOW ZONE CONFIGURATION FOR TABLE table_name opt_partition
  {
    $$.val = &tree.ShowZoneConfig{ZoneSpecifier: tree.ZoneSpecifier{
        TableOrIndex: tree.TableNameWithIndex{Table: $6.normalizableTableNameFromUnresolvedName()},
    }}
  }
| SHOW ZONE CONFIGURATION FOR PARTITION partition_name OF TABLE table_name
  {
    $$.val = &tree.ShowZoneConfig{ZoneSpecifier: tree.ZoneSpecifier{
      TableOrIndex: tree.TableNameWithIndex{Table: $9.normalizableTableNameFromUnresolvedName()},
        Partition: tree.Name($6),
    }}
  }
| SHOW ZONE CONFIGURATION FOR INDEX table_name_with_index
  {
    $$.val = &tree.ShowZoneConfig{ZoneSpecifier: tree.ZoneSpecifier{
      TableOrIndex: $6.tableWithIdx(),
    }}
  }
| SHOW ZONE CONFIGURATIONS
  {
    $$.val = &tree.ShowZoneConfig{}
  }
| SHOW ALL ZONE CONFIGURATIONS
  {
    $$.val = &tree.ShowZoneConfig{}
  }






show_ranges_stmt:
  SHOW ranges_kw FROM TABLE table_name
  {
    $$.val = &tree.ShowRanges{Table: $5.newNormalizableTableNameFromUnresolvedName()}
  }
| SHOW ranges_kw FROM INDEX table_name_with_index
  {
    $$.val = &tree.ShowRanges{Index: $5.newTableWithIdx()}
  }
| SHOW ranges_kw error  { return helpWith(sqllex, "SHOW RANGES") }

ranges_kw:
  TESTING_RANGES
| EXPERIMENTAL_RANGES

show_fingerprints_stmt:
  SHOW EXPERIMENTAL_FINGERPRINTS FROM TABLE table_name
  {

    $$.val = &tree.ShowFingerprints{Table: $5.newNormalizableTableNameFromUnresolvedName()}
  }

opt_on_targets_roles:
  ON targets_roles
  {
    tmp := $2.targetList()
    $$.val = &tmp
  }
|
  {
    $$.val = (*tree.TargetList)(nil)
  }



















































































































targets:
  IDENT
  {
    $$.val = tree.TargetList{Tables: tree.TablePatterns{&tree.UnresolvedName{NumParts:1, Parts: tree.NameParts{$1}}}}
  }
| col_name_keyword
  {
    $$.val = tree.TargetList{Tables: tree.TablePatterns{&tree.UnresolvedName{NumParts:1, Parts: tree.NameParts{$1}}}}
  }
| unreserved_keyword
  {
































    $$.val = tree.TargetList{
      Tables: tree.TablePatterns{&tree.UnresolvedName{NumParts:1, Parts: tree.NameParts{$1}}},
      ForRoles: $1 == "role",
    }
  }
| complex_table_pattern
  {
    $$.val = tree.TargetList{Tables: tree.TablePatterns{$1.unresolvedName()}}
  }
| table_pattern ',' table_pattern_list
  {
    remainderPats := $3.tablePatterns()
    $$.val = tree.TargetList{Tables: append(tree.TablePatterns{$1.unresolvedName()}, remainderPats...)}
  }
| TABLE table_pattern_list
  {
    $$.val = tree.TargetList{Tables: $2.tablePatterns()}
  }
| DATABASE name_list
  {
    $$.val = tree.TargetList{Databases: $2.nameList()}
  }




targets_roles:
  ROLE name_list
  {
     $$.val = tree.TargetList{ForRoles: true, Roles: $2.nameList()}
  }
| targets

for_grantee_clause:
  FOR name_list
  {
    $$.val = $2.nameList()
  }
|
  {
    $$.val = tree.NameList(nil)
  }







pause_stmt:
  PAUSE JOB a_expr
  {
    $$.val = &tree.ControlJobs{
      Jobs: &tree.Select{
        Select: &tree.ValuesClause{Rows: []tree.Exprs{tree.Exprs{$3.expr()}}},
      },
      Command: tree.PauseJob,
    }
  }
| PAUSE JOBS select_stmt
  {
    $$.val = &tree.ControlJobs{Jobs: $3.slct(), Command: tree.PauseJob}
  }
| PAUSE error  { return helpWith(sqllex, "PAUSE JOBS") }

































create_table_stmt:
  CREATE opt_temp TABLE table_name '(' opt_table_elem_list ')' opt_interleave opt_partition_by
  {
    $$.val = &tree.CreateTable{
      Table: $4.normalizableTableNameFromUnresolvedName(),
      IfNotExists: false,
      Interleave: $8.interleave(),
      Defs: $6.tblDefs(),
      AsSource: nil,
      AsColumnNames: nil,
      PartitionBy: $9.partitionBy(),
    }
  }
| CREATE opt_temp TABLE IF NOT EXISTS table_name '(' opt_table_elem_list ')' opt_interleave opt_partition_by
  {
    $$.val = &tree.CreateTable{
      Table: $7.normalizableTableNameFromUnresolvedName(),
      IfNotExists: true,
      Interleave: $11.interleave(),
      Defs: $9.tblDefs(),
      AsSource: nil,
      AsColumnNames: nil,
      PartitionBy: $12.partitionBy(),
    }
  }

create_table_as_stmt:
  CREATE opt_temp TABLE table_name opt_column_list AS select_stmt
  {
    $$.val = &tree.CreateTable{
      Table: $4.normalizableTableNameFromUnresolvedName(),
      IfNotExists: false,
      Interleave: nil,
      Defs: nil,
      AsSource: $7.slct(),
      AsColumnNames: $5.nameList(),
    }
  }
| CREATE opt_temp TABLE IF NOT EXISTS table_name opt_column_list AS select_stmt
  {
    $$.val = &tree.CreateTable{
      Table: $7.normalizableTableNameFromUnresolvedName(),
      IfNotExists: true,
      Interleave: nil,
      Defs: nil,
      AsSource: $10.slct(),
      AsColumnNames: $8.nameList(),
    }
  }

/*
 * Redundancy here is needed to avoid shift/reduce conflicts,
 * since TEMP is not a reserved word.  See also OptTempTableName.
 *
 * NOTE: we accept both GLOBAL and LOCAL options.  They currently do nothing,
 * but future versions might consider GLOBAL to request SQL-spec-compliant
 * temp table behavior, so warn about that.  Since we have no modules the
 * LOCAL keyword is really meaningless; furthermore, some other products
 * implement LOCAL as meaning the same as our default temp table behavior,
 * so we'll probably continue to treat LOCAL as a noise word.
 */
opt_temp:
  TEMPORARY                 { return unimplementedWithIssue(sqllex, 5807) }
| TEMP						{ return unimplementedWithIssue(sqllex, 5807) }
| LOCAL TEMPORARY			{ return unimplementedWithIssue(sqllex, 5807) }
| LOCAL TEMP				{ return unimplementedWithIssue(sqllex, 5807) }
| GLOBAL TEMPORARY          { return unimplementedWithIssue(sqllex, 5807) }
| GLOBAL TEMP               { return unimplementedWithIssue(sqllex, 5807) }
| UNLOGGED					{ return unimplemented(sqllex, "create unlogged") }
|  					{   }

opt_table_elem_list:
  table_elem_list
|
  {
    $$.val = tree.TableDefs(nil)
  }

table_elem_list:
  table_elem
  {
    $$.val = tree.TableDefs{$1.tblDef()}
  }
| table_elem_list ',' table_elem
  {
    $$.val = append($1.tblDefs(), $3.tblDef())
  }

table_elem:
  column_def
  {
    $$.val = $1.colDef()
  }
| index_def
| family_def
| table_constraint
  {
    $$.val = $1.constraintDef()
  }

opt_interleave:
  INTERLEAVE IN PARENT table_name '(' name_list ')' opt_interleave_drop_behavior
  {
    $$.val = &tree.InterleaveDef{
               Parent: $4.newNormalizableTableNameFromUnresolvedName(),
               Fields: $6.nameList(),
               DropBehavior: $8.dropBehavior(),
    }
  }
|
  {
    $$.val = (*tree.InterleaveDef)(nil)
  }


opt_interleave_drop_behavior:
  CASCADE
  {

    $$.val = tree.DropCascade
  }
| RESTRICT
  {

    $$.val = tree.DropRestrict
  }
|
  {
    $$.val = tree.DropDefault
  }

partition:
  PARTITION partition_name
  {
    $$ = $2
  }

opt_partition:
  partition
|
  {
    $$ = ""
  }

opt_partition_by:
  partition_by
|
  {
    $$.val = (*tree.PartitionBy)(nil)
  }

partition_by:
  PARTITION BY LIST '(' name_list ')' '(' list_partitions ')'
  {
    $$.val = &tree.PartitionBy{
      Fields: $5.nameList(),
      List: $8.listPartitions(),
    }
  }
| PARTITION BY RANGE '(' name_list ')' '(' range_partitions ')'
  {
    $$.val = &tree.PartitionBy{
      Fields: $5.nameList(),
      Range: $8.rangePartitions(),
    }
  }
| PARTITION BY NOTHING
  {
    $$.val = (*tree.PartitionBy)(nil)
  }

list_partitions:
  list_partition
  {
    $$.val = []tree.ListPartition{$1.listPartition()}
  }
| list_partitions ',' list_partition
  {
    $$.val = append($1.listPartitions(), $3.listPartition())
  }

list_partition:
  partition VALUES IN '(' expr_list ')' opt_partition_by
  {
    $$.val = tree.ListPartition{
      Name: tree.UnrestrictedName($1),
      Exprs: $5.exprs(),
      Subpartition: $7.partitionBy(),
    }
  }

range_partitions:
  range_partition
  {
    $$.val = []tree.RangePartition{$1.rangePartition()}
  }
| range_partitions ',' range_partition
  {
    $$.val = append($1.rangePartitions(), $3.rangePartition())
  }

range_partition:
  partition VALUES FROM '(' expr_list ')' TO '(' expr_list ')' opt_partition_by
  {
    $$.val = tree.RangePartition{
      Name: tree.UnrestrictedName($1),
      From: $5.exprs(),
      To: $9.exprs(),
      Subpartition: $11.partitionBy(),
    }
  }

column_def:
  column_name typename col_qual_list
  {
    tableDef, err := tree.NewColumnTableDef(tree.Name($1), $2.colType(), $3.colQuals())
    if err != nil {
      sqllex.Error(err.Error())
      return 1
    }
    $$.val = tableDef
  }

col_qual_list:
  col_qual_list col_qualification
  {
    $$.val = append($1.colQuals(), $2.colQual())
  }
|
  {
    $$.val = []tree.NamedColumnQualification(nil)
  }

col_qualification:
  CONSTRAINT constraint_name col_qualification_elem
  {
    $$.val = tree.NamedColumnQualification{Name: tree.Name($2), Qualification: $3.colQualElem()}
  }
| col_qualification_elem
  {
    $$.val = tree.NamedColumnQualification{Qualification: $1.colQualElem()}
  }
| COLLATE collation_name
  {
    $$.val = tree.NamedColumnQualification{Qualification: tree.ColumnCollation($2)}
  }
| FAMILY family_name
  {
    $$.val = tree.NamedColumnQualification{Qualification: &tree.ColumnFamilyConstraint{Family: tree.Name($2)}}
  }
| CREATE FAMILY family_name
  {
    $$.val = tree.NamedColumnQualification{Qualification: &tree.ColumnFamilyConstraint{Family: tree.Name($3), Create: true}}
  }
| CREATE FAMILY
  {
    $$.val = tree.NamedColumnQualification{Qualification: &tree.ColumnFamilyConstraint{Create: true}}
  }
| CREATE IF NOT EXISTS FAMILY family_name
  {
    $$.val = tree.NamedColumnQualification{Qualification: &tree.ColumnFamilyConstraint{Family: tree.Name($6), Create: true, IfNotExists: true}}
  }













col_qualification_elem:
  NOT NULL
  {
    $$.val = tree.NotNullConstraint{}
  }
| NULL
  {
    $$.val = tree.NullConstraint{}
  }
| UNIQUE
  {
    $$.val = tree.UniqueConstraint{}
  }
| PRIMARY KEY
  {
    $$.val = tree.PrimaryKeyConstraint{}
  }
| CHECK '(' a_expr ')'
  {
    $$.val = &tree.ColumnCheckConstraint{Expr: $3.expr()}
  }
| DEFAULT b_expr
  {
    $$.val = &tree.ColumnDefault{Expr: $2.expr()}
  }
| REFERENCES table_name opt_name_parens key_match reference_actions
 {
    $$.val = &tree.ColumnFKConstraint{
      Table: $2.normalizableTableNameFromUnresolvedName(),
      Col: tree.Name($3),
      Actions: $5.referenceActions(),
    }
 }
| AS '(' a_expr ')' STORED
 {
    $$.val = &tree.ColumnComputedDef{Expr: $3.expr()}
 }
| AS '(' a_expr ')' VIRTUAL
 {
    return unimplemented(sqllex, "virtual computed columns")
 }
| AS error
 {
    sqllex.Error("syntax error: use AS ( <expr> ) STORED")
    return 1
 }

index_def:
  INDEX opt_index_name '(' index_params ')' opt_storing opt_interleave opt_partition_by
  {
    $$.val = &tree.IndexTableDef{
      Name:    tree.Name($2),
      Columns: $4.idxElems(),
      Storing: $6.nameList(),
      Interleave: $7.interleave(),
      PartitionBy: $8.partitionBy(),
    }
  }
| UNIQUE INDEX opt_index_name '(' index_params ')' opt_storing opt_interleave opt_partition_by
  {
    $$.val = &tree.UniqueConstraintTableDef{
      IndexTableDef: tree.IndexTableDef {
        Name:    tree.Name($3),
        Columns: $5.idxElems(),
        Storing: $7.nameList(),
        Interleave: $8.interleave(),
        PartitionBy: $9.partitionBy(),
      },
    }
  }
| INVERTED INDEX opt_name '(' index_params ')'
  {
    $$.val = &tree.IndexTableDef{
      Name:    tree.Name($3),
      Columns: $5.idxElems(),
      Inverted: true,
    }
  }

family_def:
  FAMILY opt_family_name '(' name_list ')'
  {
    $$.val = &tree.FamilyTableDef{
      Name: tree.Name($2),
      Columns: $4.nameList(),
    }
  }




table_constraint:
  CONSTRAINT constraint_name constraint_elem
  {
    $$.val = $3.constraintDef()
    $$.val.(tree.ConstraintTableDef).SetName(tree.Name($2))
  }
| constraint_elem
  {
    $$.val = $1.constraintDef()
  }

constraint_elem:
  CHECK '(' a_expr ')'
  {
    $$.val = &tree.CheckConstraintTableDef{
      Expr: $3.expr(),
    }
  }
| UNIQUE '(' index_params ')' opt_storing opt_interleave opt_partition_by
  {
    $$.val = &tree.UniqueConstraintTableDef{
      IndexTableDef: tree.IndexTableDef{
        Columns: $3.idxElems(),
        Storing: $5.nameList(),
        Interleave: $6.interleave(),
        PartitionBy: $7.partitionBy(),
      },
    }
  }
| PRIMARY KEY '(' index_params ')'
  {
    $$.val = &tree.UniqueConstraintTableDef{
      IndexTableDef: tree.IndexTableDef{
        Columns: $4.idxElems(),
      },
      PrimaryKey:    true,
    }
  }
| FOREIGN KEY '(' name_list ')' REFERENCES table_name
    opt_column_list key_match reference_actions
  {
    $$.val = &tree.ForeignKeyConstraintTableDef{
      Table: $7.normalizableTableNameFromUnresolvedName(),
      FromCols: $4.nameList(),
      ToCols: $8.nameList(),
      Actions: $10.referenceActions(),
    }
  }

storing:
  COVERING
| STORING










opt_storing:
  storing '(' name_list ')'
  {
    $$.val = $3.nameList()
  }
|
  {
    $$.val = tree.NameList(nil)
  }

opt_column_list:
  '(' name_list ')'
  {
    $$.val = $2.nameList()
  }
|
  {
    $$.val = tree.NameList(nil)
  }

key_match:
  MATCH FULL { return unimplemented(sqllex, "references match full") }
| MATCH PARTIAL { return unimplemented(sqllex, "references match partial") }
| MATCH SIMPLE { return unimplemented(sqllex, "references match simple") }
|   {}




reference_actions:
  reference_on_update
  {
     $$.val = tree.ReferenceActions{Update: $1.referenceAction()}
  }
| reference_on_delete
  {
     $$.val = tree.ReferenceActions{Delete: $1.referenceAction()}
  }
| reference_on_update reference_on_delete
  {
    $$.val = tree.ReferenceActions{Update: $1.referenceAction(), Delete: $2.referenceAction()}
  }
| reference_on_delete reference_on_update
  {
    $$.val = tree.ReferenceActions{Delete: $1.referenceAction(), Update: $2.referenceAction()}
  }
|
  {
    $$.val = tree.ReferenceActions{}
  }

reference_on_update:
  ON UPDATE reference_action
  {
    $$.val = $3.referenceAction()
  }

reference_on_delete:
  ON DELETE reference_action
  {
    $$.val = $3.referenceAction()
  }

reference_action:


  NO ACTION
  {
    $$.val = tree.NoAction
  }
| RESTRICT
  {
    $$.val = tree.Restrict
  }
| CASCADE
  {
    $$.val = tree.Cascade
  }
| SET NULL
  {
    $$.val = tree.SetNull
  }
| SET DEFAULT
  {
    $$.val = tree.SetDefault
  }

numeric_only:
  FCONST
  {
    $$.val = $1.numVal()
  }
| '-' FCONST
  {
    n := $2.numVal()
    n.Negative = true
    $$.val = n
  }
| signed_iconst
  {
    $$.val = $1.numVal()
  }














create_sequence_stmt:
  CREATE opt_temp SEQUENCE sequence_name opt_sequence_option_list
  {
    node := &tree.CreateSequence{
      Name: $4.normalizableTableNameFromUnresolvedName(),
      Options: $5.seqOpts(),
    }
    $$.val = node
  }
| CREATE opt_temp SEQUENCE IF NOT EXISTS sequence_name opt_sequence_option_list
  {
    node := &tree.CreateSequence{
      Name: $7.normalizableTableNameFromUnresolvedName(),
      Options: $8.seqOpts(),
      IfNotExists: true,
    }
    $$.val = node
  }
| CREATE opt_temp SEQUENCE error  { return helpWith(sqllex, "CREATE SEQUENCE") }

opt_sequence_option_list:
  sequence_option_list
|            { $$.val = []tree.SequenceOption(nil) }

sequence_option_list:
  sequence_option_elem                       { $$.val = []tree.SequenceOption{$1.seqOpt()} }
| sequence_option_list sequence_option_elem  { $$.val = append($1.seqOpts(), $2.seqOpt()) }

sequence_option_elem:
  AS typename                  { return unimplementedWithIssueDetail(sqllex, 25110, $2.colType().String()) }
| CYCLE                        {
                                 $$.val = tree.SequenceOption{Name: tree.SeqOptCycle} }
| NO CYCLE                     { $$.val = tree.SequenceOption{Name: tree.SeqOptNoCycle} }
| OWNED BY column_path         { return unimplementedWithIssue(sqllex, 26382) }
| CACHE signed_iconst64        {
                                 x := $2.int64()
                                 $$.val = tree.SequenceOption{Name: tree.SeqOptCache, IntVal: &x} }
| INCREMENT signed_iconst64    { x := $2.int64()
                                 $$.val = tree.SequenceOption{Name: tree.SeqOptIncrement, IntVal: &x} }
| INCREMENT BY signed_iconst64 { x := $3.int64()
                                 $$.val = tree.SequenceOption{Name: tree.SeqOptIncrement, IntVal: &x, OptionalWord: true} }
| MINVALUE signed_iconst64     { x := $2.int64()
                                 $$.val = tree.SequenceOption{Name: tree.SeqOptMinValue, IntVal: &x} }
| NO MINVALUE                  { $$.val = tree.SequenceOption{Name: tree.SeqOptMinValue} }
| MAXVALUE signed_iconst64     { x := $2.int64()
                                 $$.val = tree.SequenceOption{Name: tree.SeqOptMaxValue, IntVal: &x} }
| NO MAXVALUE                  { $$.val = tree.SequenceOption{Name: tree.SeqOptMaxValue} }
| START signed_iconst64        { x := $2.int64()
                                 $$.val = tree.SequenceOption{Name: tree.SeqOptStart, IntVal: &x} }
| START WITH signed_iconst64   { x := $3.int64()
                                 $$.val = tree.SequenceOption{Name: tree.SeqOptStart, IntVal: &x, OptionalWord: true} }
| VIRTUAL                      { $$.val = tree.SequenceOption{Name: tree.SeqOptVirtual} }





truncate_stmt:
  TRUNCATE opt_table relation_expr_list opt_drop_behavior
  {
    $$.val = &tree.Truncate{Tables: $3.normalizableTableNames(), DropBehavior: $4.dropBehavior()}
  }
| TRUNCATE error  { return helpWith(sqllex, "TRUNCATE") }





create_user_stmt:
  CREATE USER string_or_placeholder opt_password
  {
    $$.val = &tree.CreateUser{Name: $3.expr(), Password: $4.expr()}
  }
| CREATE USER IF NOT EXISTS string_or_placeholder opt_password
  {
    $$.val = &tree.CreateUser{Name: $6.expr(), Password: $7.expr(), IfNotExists: true}
  }
| CREATE USER error  { return helpWith(sqllex, "CREATE USER") }

opt_password:
  opt_with PASSWORD string_or_placeholder
  {
    $$.val = $3.expr()
  }
|
  {
    $$.val = nil
  }





create_role_stmt:
  CREATE role_or_group string_or_placeholder
  {
    $$.val = &tree.CreateRole{Name: $3.expr()}
  }
| CREATE role_or_group IF NOT EXISTS string_or_placeholder
  {
    $$.val = &tree.CreateRole{Name: $6.expr(), IfNotExists: true}
  }
| CREATE role_or_group error  { return helpWith(sqllex, "CREATE ROLE") }



role_or_group:
  ROLE  { }
| GROUP {   }





create_view_stmt:
  CREATE opt_temp opt_view_recursive VIEW view_name opt_column_list AS select_stmt
  {
    $$.val = &tree.CreateView{
      Name: $5.normalizableTableNameFromUnresolvedName(),
      ColumnNames: $6.nameList(),
      AsSource: $8.slct(),
    }
  }
| CREATE OR REPLACE opt_temp opt_view_recursive VIEW error { return unimplementedWithIssue(sqllex, 24897) }
| CREATE opt_temp opt_view_recursive VIEW error  { return helpWith(sqllex, "CREATE VIEW") }

opt_view_recursive:
    {   }
| RECURSIVE { return unimplemented(sqllex, "create recursive view") }



create_type_stmt:

  CREATE TYPE type_name AS '(' error      { return unimplementedWithIssue(sqllex, 27792) }

| CREATE TYPE type_name AS ENUM '(' error { return unimplementedWithIssue(sqllex, 24873) }

| CREATE TYPE type_name AS RANGE error    { return unimplementedWithIssue(sqllex, 27791) }

| CREATE TYPE type_name '(' error         { return unimplementedWithIssueDetail(sqllex, 27793, "base") }

| CREATE TYPE type_name                   { return unimplementedWithIssueDetail(sqllex, 27793, "shell") }

| CREATE DOMAIN type_name error           { return unimplementedWithIssueDetail(sqllex, 27796, "create") }













create_index_stmt:
  CREATE opt_unique INDEX opt_index_name ON table_name opt_using_gin_btree '(' index_params ')' opt_storing opt_interleave opt_partition_by opt_idx_where
  {
    $$.val = &tree.CreateIndex{
      Name:    tree.Name($4),
      Table:   $6.normalizableTableNameFromUnresolvedName(),
      Unique:  $2.bool(),
      Columns: $9.idxElems(),
      Storing: $11.nameList(),
      Interleave: $12.interleave(),
      PartitionBy: $13.partitionBy(),
      Inverted: $7.bool(),
    }
  }
| CREATE opt_unique INDEX IF NOT EXISTS index_name ON table_name opt_using_gin_btree '(' index_params ')' opt_storing opt_interleave opt_partition_by opt_idx_where
  {
    $$.val = &tree.CreateIndex{
      Name:        tree.Name($7),
      Table:       $9.normalizableTableNameFromUnresolvedName(),
      Unique:      $2.bool(),
      IfNotExists: true,
      Columns:     $12.idxElems(),
      Storing:     $14.nameList(),
      Interleave:  $15.interleave(),
      PartitionBy: $16.partitionBy(),
      Inverted:    $10.bool(),
    }
  }
| CREATE opt_unique INVERTED INDEX opt_index_name ON table_name '(' index_params ')' opt_storing opt_interleave opt_partition_by opt_idx_where
  {
    $$.val = &tree.CreateIndex{
      Name:       tree.Name($5),
      Table:      $7.normalizableTableNameFromUnresolvedName(),
      Unique:     $2.bool(),
      Inverted:   true,
      Columns:    $9.idxElems(),
      Storing:     $11.nameList(),
      Interleave:  $12.interleave(),
      PartitionBy: $13.partitionBy(),
    }
  }
| CREATE opt_unique INVERTED INDEX IF NOT EXISTS index_name ON table_name '(' index_params ')' opt_storing opt_interleave opt_partition_by opt_idx_where
  {
    $$.val = &tree.CreateIndex{
      Name:        tree.Name($8),
      Table:       $10.normalizableTableNameFromUnresolvedName(),
      Unique:      $2.bool(),
      Inverted:    true,
      IfNotExists: true,
      Columns:     $12.idxElems(),
      Storing:     $14.nameList(),
      Interleave:  $15.interleave(),
      PartitionBy: $16.partitionBy(),
    }
  }
| CREATE opt_unique INDEX error  { return helpWith(sqllex, "CREATE INDEX") }

opt_idx_where:
    {   }
| WHERE error { return unimplementedWithIssue(sqllex, 9683) }

opt_using_gin_btree:
  USING name
  {

    switch $2 {
      case "gin":
        $$.val = true
      case "btree":
        $$.val = false
      case "hash", "gist", "spgist", "brin":
        return unimplemented(sqllex, "index using " + $2)
      default:
        sqllex.Error("unrecognized access method: " + $2)
        return 1
    }
  }
|
  {
    $$.val = false
  }

opt_unique:
  UNIQUE
  {
    $$.val = true
  }
|
  {
    $$.val = false
  }

index_params:
  index_elem
  {
    $$.val = tree.IndexElemList{$1.idxElem()}
  }
| index_params ',' index_elem
  {
    $$.val = append($1.idxElems(), $3.idxElem())
  }




index_elem:
  a_expr opt_asc_desc
  {

    e := $1.expr()
    if colName, ok := e.(*tree.UnresolvedName); ok && colName.NumParts == 1 {
      $$.val = tree.IndexElem{Column: tree.Name(colName.Parts[0]), Direction: $2.dir()}
    } else {
      return unimplementedWithIssueDetail(sqllex, 9682, fmt.Sprintf("%T", e))
    }
  }

opt_collate:
  COLLATE collation_name { $$ = $2 }
|   { $$ = "" }

opt_asc_desc:
  ASC
  {
    $$.val = tree.Ascending
  }
| DESC
  {
    $$.val = tree.Descending
  }
|
  {
    $$.val = tree.DefaultDirection
  }

alter_rename_database_stmt:
  ALTER DATABASE database_name RENAME TO database_name
  {
    $$.val = &tree.RenameDatabase{Name: tree.Name($3), NewName: tree.Name($6)}
  }


alter_user_password_stmt:
  ALTER USER string_or_placeholder WITH PASSWORD string_or_placeholder
  {
    $$.val = &tree.AlterUserSetPassword{Name: $3.expr(), Password: $6.expr()}
  }
| ALTER USER IF EXISTS string_or_placeholder WITH PASSWORD string_or_placeholder
  {
    $$.val = &tree.AlterUserSetPassword{Name: $5.expr(), Password: $8.expr(), IfExists: true}
  }

alter_rename_table_stmt:
  ALTER TABLE relation_expr RENAME TO table_name
  {
    $$.val = &tree.RenameTable{Name: $3.normalizableTableNameFromUnresolvedName(), NewName: $6.normalizableTableNameFromUnresolvedName(), IfExists: false, IsView: false}
  }
| ALTER TABLE IF EXISTS relation_expr RENAME TO table_name
  {
    $$.val = &tree.RenameTable{Name: $5.normalizableTableNameFromUnresolvedName(), NewName: $8.normalizableTableNameFromUnresolvedName(), IfExists: true, IsView: false}
  }
| ALTER TABLE relation_expr RENAME opt_column column_name TO column_name
  {
    $$.val = &tree.RenameColumn{Table: $3.normalizableTableNameFromUnresolvedName(), Name: tree.Name($6), NewName: tree.Name($8), IfExists: false}
  }
| ALTER TABLE IF EXISTS relation_expr RENAME opt_column column_name TO column_name
  {
    $$.val = &tree.RenameColumn{Table: $5.normalizableTableNameFromUnresolvedName(), Name: tree.Name($8), NewName: tree.Name($10), IfExists: true}
  }
| ALTER TABLE relation_expr RENAME CONSTRAINT constraint_name TO constraint_name
  { return unimplemented(sqllex, "alter table rename constraint") }
| ALTER TABLE IF EXISTS relation_expr RENAME CONSTRAINT constraint_name TO constraint_name
  { return unimplemented(sqllex, "alter table rename constraint") }

alter_rename_view_stmt:
  ALTER VIEW relation_expr RENAME TO view_name
  {
    $$.val = &tree.RenameTable{Name: $3.normalizableTableNameFromUnresolvedName(), NewName: $6.normalizableTableNameFromUnresolvedName(), IfExists: false, IsView: true}
  }
| ALTER VIEW IF EXISTS relation_expr RENAME TO view_name
  {
    $$.val = &tree.RenameTable{Name: $5.normalizableTableNameFromUnresolvedName(), NewName: $8.normalizableTableNameFromUnresolvedName(), IfExists: true, IsView: true}
  }

alter_rename_sequence_stmt:
  ALTER SEQUENCE relation_expr RENAME TO sequence_name
  {
    $$.val = &tree.RenameTable{Name: $3.normalizableTableNameFromUnresolvedName(), NewName: $6.normalizableTableNameFromUnresolvedName(), IfExists: false, IsSequence: true}
  }
| ALTER SEQUENCE IF EXISTS relation_expr RENAME TO sequence_name
  {
    $$.val = &tree.RenameTable{Name: $5.normalizableTableNameFromUnresolvedName(), NewName: $8.normalizableTableNameFromUnresolvedName(), IfExists: true, IsSequence: true}
  }

alter_rename_index_stmt:
  ALTER INDEX table_name_with_index RENAME TO index_name
  {
    $$.val = &tree.RenameIndex{Index: $3.newTableWithIdx(), NewName: tree.UnrestrictedName($6), IfExists: false}
  }
| ALTER INDEX IF EXISTS table_name_with_index RENAME TO index_name
  {
    $$.val = &tree.RenameIndex{Index: $5.newTableWithIdx(), NewName: tree.UnrestrictedName($8), IfExists: true}
  }

opt_column:
  COLUMN {}
|   {}

opt_set_data:
  SET DATA {}
|   {}





release_stmt:
  RELEASE savepoint_name
  {
    $$.val = &tree.ReleaseSavepoint{Savepoint: $2}
  }
| RELEASE error  { return helpWith(sqllex, "RELEASE") }







resume_stmt:
  RESUME JOB a_expr
  {
    $$.val = &tree.ControlJobs{
      Jobs: &tree.Select{
        Select: &tree.ValuesClause{Rows: []tree.Exprs{tree.Exprs{$3.expr()}}},
      },
      Command: tree.ResumeJob,
    }
  }
| RESUME JOBS select_stmt
  {
    $$.val = &tree.ControlJobs{Jobs: $3.slct(), Command: tree.ResumeJob}
  }
| RESUME error  { return helpWith(sqllex, "RESUME JOBS") }





savepoint_stmt:
  SAVEPOINT name
  {
    $$.val = &tree.Savepoint{Name: $2}
  }
| SAVEPOINT error  { return helpWith(sqllex, "SAVEPOINT") }


transaction_stmt:
  begin_stmt     %prec VALUES |   begin_stmt     HELPTOKEN %prec UMINUS { return helpWith(sqllex, "BEGIN") }
| commit_stmt    %prec VALUES |  commit_stmt    HELPTOKEN %prec UMINUS { return helpWith(sqllex, "COMMIT") }
| rollback_stmt  %prec VALUES |  rollback_stmt  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "ROLLBACK") }
| abort_stmt












begin_stmt:
  BEGIN opt_transaction begin_transaction
  {
    $$.val = $3.stmt()
  }
| BEGIN error  { return helpWith(sqllex, "BEGIN") }
| START TRANSACTION begin_transaction
  {
    $$.val = $3.stmt()
  }
| START error  { return helpWith(sqllex, "BEGIN") }







commit_stmt:
  COMMIT opt_transaction
  {
    $$.val = &tree.CommitTransaction{}
  }
| COMMIT error  { return helpWith(sqllex, "COMMIT") }
| END opt_transaction
  {
    $$.val = &tree.CommitTransaction{}
  }
| END error  { return helpWith(sqllex, "COMMIT") }

abort_stmt:
  ABORT opt_abort_mod
  {
    $$.val = &tree.RollbackTransaction{}
  }

opt_abort_mod:
  TRANSACTION {}
| WORK        {}
|   {}





rollback_stmt:
  ROLLBACK opt_to_savepoint
  {
    if $2 != "" {
      $$.val = &tree.RollbackToSavepoint{Savepoint: $2}
    } else {
      $$.val = &tree.RollbackTransaction{}
    }
  }
| ROLLBACK error  { return helpWith(sqllex, "ROLLBACK") }

opt_transaction:
  TRANSACTION {}
|   {}

opt_to_savepoint:
  TRANSACTION
  {
    $$ = ""
  }
| TRANSACTION TO savepoint_name
  {
    $$ = $3
  }
| TO savepoint_name
  {
    $$ = $2
  }
|
  {
    $$ = ""
  }

savepoint_name:
  SAVEPOINT name
  {
    $$ = $2
  }
| name
  {
    $$ = $1
  }

begin_transaction:
  transaction_mode_list
  {
    $$.val = &tree.BeginTransaction{Modes: $1.transactionModes()}
  }
|
  {
    $$.val = &tree.BeginTransaction{}
  }

transaction_mode_list:
  transaction_mode
  {
    $$.val = $1.transactionModes()
  }
| transaction_mode_list opt_comma transaction_mode
  {
    a := $1.transactionModes()
    b := $3.transactionModes()
    err := a.Merge(b)
    if err != nil { sqllex.Error(err.Error()); return 1 }
    $$.val = a
  }




opt_comma:
  ','
  { }
|
  { }

transaction_mode:
  transaction_iso_level
  {
    $$.val = tree.TransactionModes{Isolation: $1.isoLevel()}
  }
| transaction_user_priority
  {
    $$.val = tree.TransactionModes{UserPriority: $1.userPriority()}
  }
| transaction_read_mode
  {
    $$.val = tree.TransactionModes{ReadWriteMode: $1.readWriteMode()}
  }

transaction_user_priority:
  PRIORITY user_priority
  {
    $$.val = $2.userPriority()
  }

transaction_iso_level:
  ISOLATION LEVEL iso_level
  {
    $$.val = $3.isoLevel()
  }

transaction_read_mode:
  READ ONLY
  {
    $$.val = tree.ReadOnly
  }
| READ WRITE
  {
    $$.val = tree.ReadWrite
  }





create_database_stmt:
  CREATE DATABASE database_name opt_with opt_template_clause opt_encoding_clause opt_lc_collate_clause opt_lc_ctype_clause
  {
    $$.val = &tree.CreateDatabase{
      Name: tree.Name($3),
      Template: $5,
      Encoding: $6,
      Collate: $7,
      CType: $8,
    }
  }
| CREATE DATABASE IF NOT EXISTS database_name opt_with opt_template_clause opt_encoding_clause opt_lc_collate_clause opt_lc_ctype_clause
  {
    $$.val = &tree.CreateDatabase{
      IfNotExists: true,
      Name: tree.Name($6),
      Template: $8,
      Encoding: $9,
      Collate: $10,
      CType: $11,
    }
   }
| CREATE DATABASE error  { return helpWith(sqllex, "CREATE DATABASE") }

opt_template_clause:
  TEMPLATE opt_equal non_reserved_word_or_sconst
  {
    $$ = $3
  }
|
  {
    $$ = ""
  }

opt_encoding_clause:
  ENCODING opt_equal non_reserved_word_or_sconst
  {
    $$ = $3
  }
|
  {
    $$ = ""
  }

opt_lc_collate_clause:
  LC_COLLATE opt_equal non_reserved_word_or_sconst
  {
    $$ = $3
  }
|
  {
    $$ = ""
  }

opt_lc_ctype_clause:
  LC_CTYPE opt_equal non_reserved_word_or_sconst
  {
    $$ = $3
  }
|
  {
    $$ = ""
  }

opt_equal:
  '=' {}
|   {}









insert_stmt:
  opt_with_clause INSERT INTO insert_target insert_rest returning_clause
  {
    $$.val = $5.stmt()
    $$.val.(*tree.Insert).With = $1.with()
    $$.val.(*tree.Insert).Table = $4.tblExpr()
    $$.val.(*tree.Insert).Returning = $6.retClause()
  }
| opt_with_clause INSERT INTO insert_target insert_rest on_conflict returning_clause
  {
    $$.val = $5.stmt()
    $$.val.(*tree.Insert).With = $1.with()
    $$.val.(*tree.Insert).Table = $4.tblExpr()
    $$.val.(*tree.Insert).OnConflict = $6.onConflict()
    $$.val.(*tree.Insert).Returning = $7.retClause()
  }
| opt_with_clause INSERT error  { return helpWith(sqllex, "INSERT") }








upsert_stmt:
  opt_with_clause UPSERT INTO insert_target insert_rest returning_clause
  {
    $$.val = $5.stmt()
    $$.val.(*tree.Insert).With = $1.with()
    $$.val.(*tree.Insert).Table = $4.tblExpr()
    $$.val.(*tree.Insert).OnConflict = &tree.OnConflict{}
    $$.val.(*tree.Insert).Returning = $6.retClause()
  }
| opt_with_clause UPSERT error  { return helpWith(sqllex, "UPSERT") }

insert_target:
  table_name
  {
    $$.val = $1.newNormalizableTableNameFromUnresolvedName()
  }




| table_name AS table_alias_name
  {
    $$.val = &tree.AliasedTableExpr{Expr: $1.newNormalizableTableNameFromUnresolvedName(), As: tree.AliasClause{Alias: tree.Name($3)}}
  }

insert_rest:
  select_stmt
  {
    $$.val = &tree.Insert{Rows: $1.slct()}
  }
| '(' insert_column_list ')' select_stmt
  {
    $$.val = &tree.Insert{Columns: $2.nameList(), Rows: $4.slct()}
  }
| DEFAULT VALUES
  {
    $$.val = &tree.Insert{Rows: &tree.Select{}}
  }

insert_column_list:
  insert_column_item
  {
    $$.val = tree.NameList{tree.Name($1)}
  }
| insert_column_list ',' insert_column_item
  {
    $$.val = append($1.nameList(), tree.Name($3))
  }















insert_column_item:
  column_name
| column_name '.' error { return unimplementedWithIssue(sqllex, 8318) }

on_conflict:
  ON CONFLICT opt_conf_expr DO UPDATE SET set_clause_list where_clause
  {
    $$.val = &tree.OnConflict{Columns: $3.nameList(), Exprs: $7.updateExprs(), Where: tree.NewWhere(tree.AstWhere, $8.expr())}
  }
| ON CONFLICT opt_conf_expr DO NOTHING
  {
    $$.val = &tree.OnConflict{Columns: $3.nameList(), DoNothing: true}
  }

opt_conf_expr:
  '(' name_list ')' where_clause
  {

    $$.val = $2.nameList()
  }
| ON CONSTRAINT constraint_name { return unimplemented(sqllex, "on conflict on constraint") }
|
  {
    $$.val = tree.NameList(nil)
  }

returning_clause:
  RETURNING target_list
  {
    ret := tree.ReturningExprs($2.selExprs())
    $$.val = &ret
  }
| RETURNING NOTHING
  {
    $$.val = tree.ReturningNothingClause
  }
|
  {
    $$.val = tree.AbsentReturningClause
  }











update_stmt:
  opt_with_clause UPDATE table_name_expr_opt_alias_idx
    SET set_clause_list update_from_clause where_clause opt_sort_clause opt_limit_clause returning_clause
  {
    $$.val = &tree.Update{
      With: $1.with(),
      Table: $3.tblExpr(),
      Exprs: $5.updateExprs(),
      Where: tree.NewWhere(tree.AstWhere, $7.expr()),
      OrderBy: $8.orderBy(),
      Limit: $9.limit(),
      Returning: $10.retClause(),
    }
  }
| opt_with_clause UPDATE error  { return helpWith(sqllex, "UPDATE") }


update_from_clause:
  FROM from_list { return unimplementedWithIssue(sqllex, 7841) }
|   {}

set_clause_list:
  set_clause
  {
    $$.val = tree.UpdateExprs{$1.updateExpr()}
  }
| set_clause_list ',' set_clause
  {
    $$.val = append($1.updateExprs(), $3.updateExpr())
  }




set_clause:
  single_set_clause
| multiple_set_clause

single_set_clause:
  column_name '=' a_expr
  {
    $$.val = &tree.UpdateExpr{Names: tree.NameList{tree.Name($1)}, Expr: $3.expr()}
  }
| column_name '.' error { return unimplementedWithIssue(sqllex, 8318) }

multiple_set_clause:
  '(' insert_column_list ')' '=' in_expr
  {
    $$.val = &tree.UpdateExpr{Tuple: true, Names: $2.nameList(), Expr: $5.expr()}
  }





































select_stmt:
  select_no_parens %prec UMINUS
| select_with_parens %prec UMINUS
  {
    $$.val = &tree.Select{Select: $1.selectStmt()}
  }

select_with_parens:
  '(' select_no_parens ')'
  {
    $$.val = &tree.ParenSelect{Select: $2.slct()}
  }
| '(' select_with_parens ')'
  {
    $$.val = &tree.ParenSelect{Select: &tree.Select{Select: $2.selectStmt()}}
  }










select_no_parens:
  simple_select opt_for
  {
    $$.val = &tree.Select{Select: $1.selectStmt()}
  }
| select_clause sort_clause opt_for
  {
    $$.val = &tree.Select{Select: $1.selectStmt(), OrderBy: $2.orderBy()}
  }
| select_clause opt_sort_clause select_limit opt_for
  {
    $$.val = &tree.Select{Select: $1.selectStmt(), OrderBy: $2.orderBy(), Limit: $3.limit()}
  }
| with_clause select_clause opt_for
  {
    $$.val = &tree.Select{With: $1.with(), Select: $2.selectStmt()}
  }
| with_clause select_clause sort_clause opt_for
  {
    $$.val = &tree.Select{With: $1.with(), Select: $2.selectStmt(), OrderBy: $3.orderBy()}
  }
| with_clause select_clause opt_sort_clause select_limit opt_for
  {
    $$.val = &tree.Select{With: $1.with(), Select: $2.selectStmt(), OrderBy: $3.orderBy(), Limit: $4.limit()}
  }

opt_for:
    {   }
| FOR error { return unimplementedWithIssue(sqllex, 6583) }

select_clause:


  '(' error  { return helpWith(sqllex, "<SELECTCLAUSE>") }
| simple_select
| select_with_parens































simple_select:
  simple_select_clause  %prec VALUES |   simple_select_clause  HELPTOKEN %prec UMINUS { return helpWith(sqllex, "SELECT") }
| values_clause         %prec VALUES |  values_clause         HELPTOKEN %prec UMINUS { return helpWith(sqllex, "VALUES") }
| table_clause          %prec VALUES |  table_clause          HELPTOKEN %prec UMINUS { return helpWith(sqllex, "TABLE") }
| set_operation
















simple_select_clause:
  SELECT opt_all_clause target_list
    from_clause where_clause
    group_clause having_clause window_clause
  {
    $$.val = &tree.SelectClause{
      Exprs:   $3.selExprs(),
      From:    $4.from(),
      Where:   tree.NewWhere(tree.AstWhere, $5.expr()),
      GroupBy: $6.groupBy(),
      Having:  tree.NewWhere(tree.AstHaving, $7.expr()),
      Window:  $8.window(),
    }
  }
| SELECT distinct_clause target_list
    from_clause where_clause
    group_clause having_clause window_clause
  {
    $$.val = &tree.SelectClause{
      Distinct: $2.bool(),
      Exprs:    $3.selExprs(),
      From:     $4.from(),
      Where:    tree.NewWhere(tree.AstWhere, $5.expr()),
      GroupBy:  $6.groupBy(),
      Having:   tree.NewWhere(tree.AstHaving, $7.expr()),
      Window:   $8.window(),
    }
  }
| SELECT distinct_on_clause target_list
    from_clause where_clause
    group_clause having_clause window_clause
  {
    $$.val = &tree.SelectClause{
      Distinct:   true,
      DistinctOn: $2.distinctOn(),
      Exprs:      $3.selExprs(),
      From:       $4.from(),
      Where:      tree.NewWhere(tree.AstWhere, $5.expr()),
      GroupBy:    $6.groupBy(),
      Having:     tree.NewWhere(tree.AstHaving, $7.expr()),
      Window:     $8.window(),
    }
  }
| SELECT error  { return helpWith(sqllex, "SELECT") }

set_operation:
  select_clause UNION all_or_distinct select_clause
  {
    $$.val = &tree.UnionClause{
      Type:  tree.UnionOp,
      Left:  &tree.Select{Select: $1.selectStmt()},
      Right: &tree.Select{Select: $4.selectStmt()},
      All:   $3.bool(),
    }
  }
| select_clause INTERSECT all_or_distinct select_clause
  {
    $$.val = &tree.UnionClause{
      Type:  tree.IntersectOp,
      Left:  &tree.Select{Select: $1.selectStmt()},
      Right: &tree.Select{Select: $4.selectStmt()},
      All:   $3.bool(),
    }
  }
| select_clause EXCEPT all_or_distinct select_clause
  {
    $$.val = &tree.UnionClause{
      Type:  tree.ExceptOp,
      Left:  &tree.Select{Select: $1.selectStmt()},
      Right: &tree.Select{Select: $4.selectStmt()},
      All:   $3.bool(),
    }
  }





table_clause:
  TABLE table_ref
  {
    $$.val = &tree.SelectClause{
      Exprs:       tree.SelectExprs{tree.StarSelectExpr()},
      From:        &tree.From{Tables: tree.TableExprs{$2.tblExpr()}},
      TableSelect: true,
    }
  }
| TABLE error  { return helpWith(sqllex, "TABLE") }









with_clause:
  WITH cte_list
  {
    $$.val = &tree.With{CTEList: $2.ctes()}
  }
| WITH_LA cte_list
  {

    $$.val = &tree.With{CTEList: $2.ctes()}
  }
| WITH RECURSIVE cte_list { return unimplementedWithIssue(sqllex, 21085) }

cte_list:
  common_table_expr
  {
    $$.val = []*tree.CTE{$1.cte()}
  }
| cte_list ',' common_table_expr
  {
    $$.val = append($1.ctes(), $3.cte())
  }

common_table_expr:
  table_alias_name opt_column_list AS '(' preparable_stmt ')'
  {
    $$.val = &tree.CTE{
      Name: tree.AliasClause{Alias: tree.Name($1), Cols: $2.nameList() },
      Stmt: $5.stmt(),
    }
  }

opt_with:
  WITH {}
|   {}

opt_with_clause:
  with_clause
  {
    $$.val = $1.with()
  }
|
  {
    $$.val = nil
  }

opt_table:
  TABLE {}
|   {}

all_or_distinct:
  ALL
  {
    $$.val = true
  }
| DISTINCT
  {
    $$.val = false
  }
|
  {
    $$.val = false
  }

distinct_clause:
  DISTINCT
  {
    $$.val = true
  }

distinct_on_clause:
  DISTINCT ON '(' expr_list ')'
  {
    $$.val = tree.DistinctOn($4.exprs())
  }

opt_all_clause:
  ALL {}
|   {}

opt_sort_clause_err:
  sort_clause { return unimplementedWithIssue(sqllex, 23620) }
|   {}

opt_sort_clause:
  sort_clause
  {
    $$.val = $1.orderBy()
  }
|
  {
    $$.val = tree.OrderBy(nil)
  }

sort_clause:
  ORDER BY sortby_list
  {
    $$.val = tree.OrderBy($3.orders())
  }

sortby_list:
  sortby
  {
    $$.val = []*tree.Order{$1.order()}
  }
| sortby_list ',' sortby
  {
    $$.val = append($1.orders(), $3.order())
  }

sortby:
  a_expr opt_asc_desc
  {
    $$.val = &tree.Order{OrderType: tree.OrderByColumn, Expr: $1.expr(), Direction: $2.dir()}
  }
| PRIMARY KEY table_name opt_asc_desc
  {
    $$.val = &tree.Order{OrderType: tree.OrderByIndex, Direction: $4.dir(), Table: $3.normalizableTableNameFromUnresolvedName()}
  }
| INDEX table_name '@' index_name opt_asc_desc
  {
    $$.val = &tree.Order{OrderType: tree.OrderByIndex, Direction: $5.dir(), Table: $2.normalizableTableNameFromUnresolvedName(), Index: tree.UnrestrictedName($4) }
  }




select_limit:
  limit_clause offset_clause
  {
    if $1.limit() == nil {
      $$.val = $2.limit()
    } else {
      $$.val = $1.limit()
      $$.val.(*tree.Limit).Offset = $2.limit().Offset
    }
  }
| offset_clause limit_clause
  {
    $$.val = $1.limit()
    if $2.limit() != nil {
      $$.val.(*tree.Limit).Count = $2.limit().Count
    }
  }
| limit_clause
| offset_clause

opt_limit_clause:
  limit_clause
|   { $$.val = (*tree.Limit)(nil) }

limit_clause:
  LIMIT select_limit_value
  {
    if $2.expr() == nil {
      $$.val = (*tree.Limit)(nil)
    } else {
      $$.val = &tree.Limit{Count: $2.expr()}
    }
  }

| FETCH first_or_next opt_select_fetch_first_value row_or_rows ONLY
  {
    $$.val = &tree.Limit{Count: $3.expr()}
  }

offset_clause:
  OFFSET a_expr
  {
    $$.val = &tree.Limit{Offset: $2.expr()}
  }



| OFFSET c_expr row_or_rows
  {
    $$.val = &tree.Limit{Offset: $2.expr()}
  }

select_limit_value:
  a_expr
| ALL
  {
    $$.val = tree.Expr(nil)
  }




 opt_select_fetch_first_value:
   signed_iconst
   {
     $$.val = $1.expr()
   }
 | '(' a_expr ')'
   {
     $$.val = $2.expr()
   }
 |
   {
     $$.val = &tree.NumVal{Value: constant.MakeInt64(1)}
   }


row_or_rows:
  ROW {}
| ROWS {}

first_or_next:
  FIRST {}
| NEXT {}














group_clause:
  GROUP BY expr_list
  {
    $$.val = tree.GroupBy($3.exprs())
  }
|
  {
    $$.val = tree.GroupBy(nil)
  }

having_clause:
  HAVING a_expr
  {
    $$.val = $2.expr()
  }
|
  {
    $$.val = tree.Expr(nil)
  }














values_clause:
  VALUES '(' expr_list ')' %prec UMINUS
  {
    $$.val = &tree.ValuesClause{Rows: []tree.Exprs{$3.exprs()}}
  }
| VALUES error  { return helpWith(sqllex, "VALUES") }
| values_clause ',' '(' expr_list ')'
  {
    valNode := $1.selectStmt().(*tree.ValuesClause)
    valNode.Rows = append(valNode.Rows, $4.exprs())
    $$.val = valNode
  }





from_clause:
  FROM from_list opt_as_of_clause
  {
    $$.val = &tree.From{Tables: $2.tblExprs(), AsOf: $3.asOfClause()}
  }
| FROM error  { return helpWith(sqllex, "<SOURCE>") }
|
  {
    $$.val = &tree.From{}
  }

from_list:
  table_ref
  {
    $$.val = tree.TableExprs{$1.tblExpr()}
  }
| from_list ',' table_ref
  {
    $$.val = append($1.tblExprs(), $3.tblExpr())
  }

index_flags_param:
  FORCE_INDEX '=' index_name
  {
     $$.val = &tree.IndexFlags{Index: tree.UnrestrictedName($3)}
  }
| FORCE_INDEX '=' '[' iconst64 ']'
  {

    $$.val = &tree.IndexFlags{IndexID: tree.IndexID($4.int64())}
  }
|
  NO_INDEX_JOIN
  {
     $$.val = &tree.IndexFlags{NoIndexJoin: true}
  }

index_flags_param_list:
  index_flags_param
  {
    $$.val = $1.indexFlags()
  }
|
  index_flags_param_list ',' index_flags_param
  {
    a := $1.indexFlags()
    b := $3.indexFlags()
    if err := a.CombineWith(b); err != nil {
      sqllex.Error(err.Error())
      return 1
    }
    $$.val = a
  }

opt_index_flags:
  '@' index_name
  {
    $$.val = &tree.IndexFlags{Index: tree.UnrestrictedName($2)}
  }
| '@' '[' iconst64 ']'
  {
    $$.val = &tree.IndexFlags{IndexID: tree.IndexID($3.int64())}
  }
| '@' '{' index_flags_param_list '}'
  {
    $$.val = $3.indexFlags()
  }
|
  {
    $$.val = (*tree.IndexFlags)(nil)
  }






















table_ref:
  '[' iconst64 opt_tableref_col_list alias_clause ']' opt_index_flags opt_ordinality opt_alias_clause
  {

    $$.val = &tree.AliasedTableExpr{
        Expr: &tree.TableRef{
           TableID: $2.int64(),
           Columns: $3.tableRefCols(),
           As:      $4.aliasClause(),
        },
        IndexFlags: $6.indexFlags(),
        Ordinality: $7.bool(),
        As:         $8.aliasClause(),
    }
  }
| relation_expr opt_index_flags opt_ordinality opt_alias_clause
  {
    $$.val = &tree.AliasedTableExpr{
      Expr:       $1.newNormalizableTableNameFromUnresolvedName(),
      IndexFlags: $2.indexFlags(),
      Ordinality: $3.bool(),
      As:         $4.aliasClause(),
    }
  }
| select_with_parens opt_ordinality opt_alias_clause
  {
    $$.val = &tree.AliasedTableExpr{
      Expr:       &tree.Subquery{Select: $1.selectStmt()},
      Ordinality: $2.bool(),
      As:         $3.aliasClause(),
    }
  }
| LATERAL select_with_parens opt_ordinality opt_alias_clause { return unimplementedWithIssueDetail(sqllex, 24560, "select") }
| joined_table
  {
    $$.val = $1.tblExpr()
  }
| '(' joined_table ')' opt_ordinality alias_clause
  {
    $$.val = &tree.AliasedTableExpr{Expr: &tree.ParenTableExpr{Expr: $2.tblExpr()}, Ordinality: $4.bool(), As: $5.aliasClause()}
  }
| func_table opt_ordinality opt_alias_clause
  {
    f := $1.tblExpr()
    $$.val = &tree.AliasedTableExpr{Expr: f, Ordinality: $2.bool(), As: $3.aliasClause()}
  }
| LATERAL func_table opt_ordinality opt_alias_clause { return unimplementedWithIssueDetail(sqllex, 24560, "srf") }














| '[' preparable_stmt ']' opt_ordinality opt_alias_clause
  {
    $$.val = &tree.AliasedTableExpr{Expr: &tree.StatementSource{ Statement: $2.stmt() }, Ordinality: $4.bool(), As: $5.aliasClause() }
  }

func_table:
  func_expr_windowless
  {
    $$.val = &tree.RowsFromExpr{Items: tree.Exprs{$1.expr()}}
  }
| ROWS FROM '(' rowsfrom_list ')'
  {
    $$.val = &tree.RowsFromExpr{Items: $4.exprs()}
  }

rowsfrom_list:
  rowsfrom_item
  { $$.val = tree.Exprs{$1.expr()} }
| rowsfrom_list ',' rowsfrom_item
  { $$.val = append($1.exprs(), $3.expr()) }

rowsfrom_item:
  func_expr_windowless opt_col_def_list
  {
    $$.val = $1.expr()
  }

opt_col_def_list:

  { }
| AS '(' error
  { return unimplemented(sqllex, "ROWS FROM with col_def_list") }

opt_tableref_col_list:
                  { $$.val = nil }
| '(' ')'                   { $$.val = []tree.ColumnID{} }
| '(' tableref_col_list ')' { $$.val = $2.tableRefCols() }

tableref_col_list:
  iconst64
  {
    $$.val = []tree.ColumnID{tree.ColumnID($1.int64())}
  }
| tableref_col_list ',' iconst64
  {
    $$.val = append($1.tableRefCols(), tree.ColumnID($3.int64()))
  }

opt_ordinality:
  WITH_LA ORDINALITY
  {
    $$.val = true
  }
|
  {
    $$.val = false
  }















joined_table:
  '(' joined_table ')'
  {
    $$.val = &tree.ParenTableExpr{Expr: $2.tblExpr()}
  }
| table_ref CROSS JOIN table_ref
  {
    $$.val = &tree.JoinTableExpr{Join: tree.AstCrossJoin, Left: $1.tblExpr(), Right: $4.tblExpr()}
  }
| table_ref join_type JOIN table_ref join_qual
  {
    $$.val = &tree.JoinTableExpr{Join: $2, Left: $1.tblExpr(), Right: $4.tblExpr(), Cond: $5.joinCond()}
  }
| table_ref JOIN table_ref join_qual
  {
    $$.val = &tree.JoinTableExpr{Join: tree.AstJoin, Left: $1.tblExpr(), Right: $3.tblExpr(), Cond: $4.joinCond()}
  }
| table_ref NATURAL join_type JOIN table_ref
  {
    $$.val = &tree.JoinTableExpr{Join: $3, Left: $1.tblExpr(), Right: $5.tblExpr(), Cond: tree.NaturalJoinCond{}}
  }
| table_ref NATURAL JOIN table_ref
  {
    $$.val = &tree.JoinTableExpr{Join: tree.AstJoin, Left: $1.tblExpr(), Right: $4.tblExpr(), Cond: tree.NaturalJoinCond{}}
  }

alias_clause:
  AS table_alias_name opt_column_list
  {
    $$.val = tree.AliasClause{Alias: tree.Name($2), Cols: $3.nameList()}
  }
| table_alias_name opt_column_list
  {
    $$.val = tree.AliasClause{Alias: tree.Name($1), Cols: $2.nameList()}
  }

opt_alias_clause:
  alias_clause
|
  {
    $$.val = tree.AliasClause{}
  }

as_of_clause:
  AS_LA OF SYSTEM TIME a_expr
  {
    $$.val = tree.AsOfClause{Expr: $5.expr()}
  }

opt_as_of_clause:
  as_of_clause
|
  {
    $$.val = tree.AsOfClause{}
  }

join_type:
  FULL join_outer
  {
    $$ = tree.AstFullJoin
  }
| LEFT join_outer
  {
    $$ = tree.AstLeftJoin
  }
| RIGHT join_outer
  {
    $$ = tree.AstRightJoin
  }
| INNER
  {
    $$ = tree.AstInnerJoin
  }


join_outer:
  OUTER {}
|   {}








join_qual:
  USING '(' name_list ')'
  {
    $$.val = &tree.UsingJoinCond{Cols: $3.nameList()}
  }
| ON a_expr
  {
    $$.val = &tree.OnJoinCond{Expr: $2.expr()}
  }

relation_expr:
  table_name              { $$.val = $1.unresolvedName() }
| table_name '*'          { $$.val = $1.unresolvedName() }
| ONLY table_name         { $$.val = $2.unresolvedName() }
| ONLY '(' table_name ')' { $$.val = $3.unresolvedName() }

relation_expr_list:
  relation_expr
  {
    $$.val = tree.NormalizableTableNames{$1.normalizableTableNameFromUnresolvedName()}
  }
| relation_expr_list ',' relation_expr
  {
    $$.val = append($1.normalizableTableNames(), $3.normalizableTableNameFromUnresolvedName())
  }








table_name_expr_opt_alias_idx:
  table_name_expr_with_index %prec UMINUS
  {
     $$.val = $1.tblExpr()
  }
| table_name_expr_with_index table_alias_name
  {
     alias := $1.tblExpr().(*tree.AliasedTableExpr)
     alias.As = tree.AliasClause{Alias: tree.Name($2)}
     $$.val = alias
  }
| table_name_expr_with_index AS table_alias_name
  {
     alias := $1.tblExpr().(*tree.AliasedTableExpr)
     alias.As = tree.AliasClause{Alias: tree.Name($3)}
     $$.val = alias
  }

table_name_expr_with_index:
  table_name opt_index_flags
  {
    $$.val = &tree.AliasedTableExpr{
      Expr: $1.newNormalizableTableNameFromUnresolvedName(),
      IndexFlags: $2.indexFlags(),
    }
  }

where_clause:
  WHERE a_expr
  {
    $$.val = $2.expr()
  }
|
  {
    $$.val = tree.Expr(nil)
  }







typename:
  simple_typename opt_array_bounds
  {
    if bounds := $2.int32s(); bounds != nil {
      var err error
      $$.val, err = coltypes.ArrayOf($1.colType(), bounds)
      if err != nil {
        sqllex.Error(err.Error())
        return 1
      }
    } else {
      $$.val = $1.colType()
    }
  }


| simple_typename ARRAY '[' ICONST ']' {

    var err error
    $$.val, err = coltypes.ArrayOf($1.colType(), []int32{-1})
    if err != nil {
      sqllex.Error(err.Error())
      return 1
    }
  }
| simple_typename ARRAY {
    var err error
    $$.val, err = coltypes.ArrayOf($1.colType(), []int32{-1})
    if err != nil {
      sqllex.Error(err.Error())
      return 1
    }
  }
| postgres_oid
  {
    $$.val = $1.castTargetType()
  }

cast_target:
  typename
  {
    $$.val = $1.colType()
  }

opt_array_bounds:


  '[' ']' { $$.val = []int32{-1} }
| '[' ICONST ']'
  {

    bound, err := $2.numVal().AsInt32()
    if err != nil {
      sqllex.Error(err.Error())
      return 1
    }
    $$.val = []int32{bound}
  }
|   { $$.val = []int32(nil) }

const_json:
  JSON
| JSONB

simple_typename:
  const_typename
| bit_with_length
| character_with_length
| const_interval
| const_interval interval_qualifier { return unimplemented(sqllex, "interval with unit qualifier") }
| const_interval '(' ICONST ')' { return unimplemented(sqllex, "interval with precision") }










const_typename:
  numeric
| bit_without_length
| character_without_length
| const_datetime
| const_json
  {
    $$.val = coltypes.JSON
  }
| BLOB
  {
    $$.val = coltypes.Bytes
  }
| BYTES
  {
    $$.val = coltypes.Bytes
  }
| BYTEA
  {
    $$.val = coltypes.Bytes
  }
| TEXT
  {
    $$.val = coltypes.String
  }
| NAME
  {
    $$.val = coltypes.Name
  }
| SERIAL
  {
    $$.val = coltypes.Serial
  }
| SERIAL2
  {
    $$.val = coltypes.Serial2
  }
| SMALLSERIAL
  {
    $$.val = coltypes.Serial2
  }
| SERIAL4
  {
    $$.val = coltypes.Serial4
  }
| SERIAL8
  {
    $$.val = coltypes.Serial8
  }
| BIGSERIAL
  {
    $$.val = coltypes.Serial8
  }
| UUID
  {
    $$.val = coltypes.UUID
  }
| INET
  {
    $$.val = coltypes.INet
  }
| OID
  {
    $$.val = coltypes.Oid
  }
| OIDVECTOR
  {
    $$.val = coltypes.OidVector
  }
| INT2VECTOR
  {
    $$.val = coltypes.Int2vector
  }
| IDENT
  {






    if $1 == "char" {
      $$.val = coltypes.QChar
    } else {
      var ok bool
      var unimp int
      $$.val, ok, unimp = coltypes.TypeForNonKeywordTypeName($1)
      if !ok {
          switch unimp {
              case 0:


                sqllex.Error("type does not exist")
                return 1
              case -1:
                return unimplemented(sqllex, "type name " + $1)
              default:
                return unimplementedWithIssueDetail(sqllex, unimp, $1)
          }
      }
    }
  }

opt_numeric_modifiers:
  '(' iconst64 ')'
  {
    $$.val = &coltypes.TDecimal{Prec: int($2.int64())}
  }
| '(' iconst64 ',' iconst64 ')'
  {
    $$.val = &coltypes.TDecimal{Prec: int($2.int64()), Scale: int($4.int64())}
  }
|
  {
    $$.val = nil
  }


numeric:
  INT
  {
    $$.val = coltypes.Int
  }
| INTEGER
  {
    $$.val = coltypes.Int
  }
| INT2
  {
    $$.val = coltypes.Int2
  }
| SMALLINT
  {
    $$.val = coltypes.Int2
  }
| INT4
  {
    $$.val = coltypes.Int4
  }
| INT8
  {
    $$.val = coltypes.Int8
  }
| INT64
  {
    $$.val = coltypes.Int8
  }
| BIGINT
  {
    $$.val = coltypes.Int8
  }
| REAL
  {
    $$.val = coltypes.Float4
  }
| FLOAT4
    {
      $$.val = coltypes.Float4
    }
| FLOAT8
    {
      $$.val = coltypes.Float8
    }
| FLOAT opt_float
  {
    $$.val = $2.colType()
  }
| DOUBLE PRECISION
  {
    $$.val = coltypes.Float8
  }
| DECIMAL opt_numeric_modifiers
  {
    $$.val = $2.colType()
    if $$.val == nil {
      $$.val = coltypes.Decimal
    }
  }
| DEC opt_numeric_modifiers
  {
    $$.val = $2.colType()
    if $$.val == nil {
      $$.val = coltypes.Decimal
    }
  }
| NUMERIC opt_numeric_modifiers
  {
    $$.val = $2.colType()
    if $$.val == nil {
      $$.val = coltypes.Decimal
    }
  }
| BOOLEAN
  {
    $$.val = coltypes.Bool
  }
| BOOL
  {
    $$.val = coltypes.Bool
  }


postgres_oid:
  REGPROC
  {
    $$.val = coltypes.RegProc
  }
| REGPROCEDURE
  {
    $$.val = coltypes.RegProcedure
  }
| REGCLASS
  {
    $$.val = coltypes.RegClass
  }
| REGTYPE
  {
    $$.val = coltypes.RegType
  }
| REGNAMESPACE
  {
    $$.val = coltypes.RegNamespace
  }

opt_float:
  '(' ICONST ')'
  {
    nv := $2.numVal()
    prec, err := nv.AsInt64()
    if err != nil {
      sqllex.Error(err.Error())
      return 1
    }
    typ, err := coltypes.NewFloat(prec)
    if err != nil {
      sqllex.Error(err.Error())
      return 1
    }
    $$.val = typ
  }
|
  {
    $$.val = coltypes.Float8
  }

bit_with_length:
  BIT opt_varying '(' iconst64 ')'
  {
    return unimplementedWithIssue(sqllex, 20991)
  }

bit_without_length:
  BIT opt_varying
  {
    return unimplementedWithIssue(sqllex, 20991)
  }

character_with_length:
  character_base '(' iconst64 ')'
  {
    colTyp := *($1.colType().(*coltypes.TString))
    n := $3.int64()
    if n == 0 {
      sqllex.Error(fmt.Sprintf("length for type %s must be at least 1", &colTyp))
      return 1
    }
    colTyp.N = uint(n)
    $$.val = &colTyp
  }

character_without_length:
  character_base
  {
    $$.val = $1.colType()
  }

character_base:
  char_aliases
  {
    $$.val = coltypes.Char
  }
| char_aliases VARYING
  {
    $$.val = coltypes.VarChar
  }
| VARCHAR
  {
    $$.val = coltypes.VarChar
  }
| STRING
  {
    $$.val = coltypes.String
  }

char_aliases:
  CHAR
| CHARACTER

opt_varying:
  VARYING {}
|   {}


const_datetime:
  DATE
  {
    $$.val = coltypes.Date
  }
| TIME
  {
    $$.val = coltypes.Time
  }
| TIME WITHOUT TIME ZONE
  {
    $$.val = coltypes.Time
  }
| TIMETZ
  {
    return unimplementedWithIssueDetail(sqllex, 26097, "type")
  }
| TIME WITH_LA TIME ZONE
  {
    return unimplementedWithIssueDetail(sqllex, 26097, "type")
  }
| TIMESTAMP
  {
    $$.val = coltypes.Timestamp
  }
| TIMESTAMP WITHOUT TIME ZONE
  {
    $$.val = coltypes.Timestamp
  }
| TIMESTAMPTZ
  {
    $$.val = coltypes.TimestampWithTZ
  }
| TIMESTAMP WITH_LA TIME ZONE
  {
    $$.val = coltypes.TimestampWithTZ
  }

const_interval:
  INTERVAL {
    $$.val = coltypes.Interval
  }

interval_qualifier:
  YEAR
  {
    $$.val = tree.Year
  }
| MONTH
  {
    $$.val = tree.Month
  }
| DAY
  {
    $$.val = tree.Day
  }
| HOUR
  {
    $$.val = tree.Hour
  }
| MINUTE
  {
    $$.val = tree.Minute
  }
| interval_second
  {
    $$.val = $1.durationField()
  }


| YEAR TO MONTH
  {
    $$.val = tree.Month
  }
| DAY TO HOUR
  {
    $$.val = tree.Hour
  }
| DAY TO MINUTE
  {
    $$.val = tree.Minute
  }
| DAY TO interval_second
  {
    $$.val = $3.durationField()
  }
| HOUR TO MINUTE
  {
    $$.val = tree.Minute
  }
| HOUR TO interval_second
  {
    $$.val = $3.durationField()
  }
| MINUTE TO interval_second
  {
    $$.val = $3.durationField()
  }

opt_interval:
  interval_qualifier
|
  {
    $$.val = nil
  }

interval_second:
  SECOND
  {
    $$.val = tree.Second
  }
| SECOND '(' ICONST ')' { return unimplemented(sqllex, "interval second with precision") }




















a_expr:
  c_expr
| a_expr TYPECAST cast_target
  {
    $$.val = &tree.CastExpr{Expr: $1.expr(), Type: $3.castTargetType(), SyntaxMode: tree.CastShort}
  }
| a_expr TYPEANNOTATE typename
  {
    $$.val = &tree.AnnotateTypeExpr{Expr: $1.expr(), Type: $3.colType(), SyntaxMode: tree.AnnotateShort}
  }
| a_expr COLLATE collation_name
  {
    $$.val = &tree.CollateExpr{Expr: $1.expr(), Locale: $3}
  }
| a_expr AT TIME ZONE a_expr %prec AT { return unimplemented(sqllex, "at tz") }







| '+' a_expr %prec UMINUS
  {

    $$.val = $2.expr()
  }
| '-' a_expr %prec UMINUS
  {
    $$.val = unaryNegation($2.expr())
  }
| '~' a_expr %prec UMINUS
  {
    $$.val = &tree.UnaryExpr{Operator: tree.UnaryComplement, Expr: $2.expr()}
  }
| a_expr '+' a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Plus, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '-' a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Minus, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '*' a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Mult, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '/' a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Div, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr FLOORDIV a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.FloorDiv, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '%' a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Mod, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '^' a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Pow, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '#' a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Bitxor, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '&' a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Bitand, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '|' a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Bitor, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '<' a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.LT, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '>' a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.GT, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '?' a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.JSONExists, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr JSON_SOME_EXISTS a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.JSONSomeExists, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr JSON_ALL_EXISTS a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.JSONAllExists, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr CONTAINS a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.Contains, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr CONTAINED_BY a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.ContainedBy, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr '=' a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.EQ, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr CONCAT a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Concat, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr LSHIFT a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.LShift, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr RSHIFT a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.RShift, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr FETCHVAL a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.JSONFetchVal, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr FETCHTEXT a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.JSONFetchText, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr FETCHVAL_PATH a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.JSONFetchValPath, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr FETCHTEXT_PATH a_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.JSONFetchTextPath, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr REMOVE_PATH a_expr
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("json_remove_path"), Exprs: tree.Exprs{$1.expr(), $3.expr()}}
  }
| a_expr INET_CONTAINED_BY_OR_EQUALS a_expr
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("inet_contained_by_or_equals"), Exprs: tree.Exprs{$1.expr(), $3.expr()}}
  }
| a_expr INET_CONTAINS_OR_CONTAINED_BY a_expr
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("inet_contains_or_contained_by"), Exprs: tree.Exprs{$1.expr(), $3.expr()}}
  }
| a_expr INET_CONTAINS_OR_EQUALS a_expr
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("inet_contains_or_equals"), Exprs: tree.Exprs{$1.expr(), $3.expr()}}
  }
| a_expr LESS_EQUALS a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.LE, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr GREATER_EQUALS a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.GE, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr NOT_EQUALS a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.NE, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr AND a_expr
  {
    $$.val = &tree.AndExpr{Left: $1.expr(), Right: $3.expr()}
  }
| a_expr OR a_expr
  {
    $$.val = &tree.OrExpr{Left: $1.expr(), Right: $3.expr()}
  }
| NOT a_expr
  {
    $$.val = &tree.NotExpr{Expr: $2.expr()}
  }
| NOT_LA a_expr %prec NOT
  {
    $$.val = &tree.NotExpr{Expr: $2.expr()}
  }
| a_expr LIKE a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.Like, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr LIKE a_expr ESCAPE a_expr %prec ESCAPE
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("like_escape"), Exprs: tree.Exprs{$1.expr(), $3.expr(), $5.expr()}}
  }
| a_expr NOT_LA LIKE a_expr %prec NOT_LA
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.NotLike, Left: $1.expr(), Right: $4.expr()}
  }
| a_expr NOT_LA LIKE a_expr ESCAPE a_expr %prec ESCAPE
 {
   $$.val = &tree.FuncExpr{Func: tree.WrapFunction("not_like_escape"), Exprs: tree.Exprs{$1.expr(), $4.expr(), $6.expr()}}
 }
| a_expr ILIKE a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.ILike, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr ILIKE a_expr ESCAPE a_expr %prec ESCAPE
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("ilike_escape"), Exprs: tree.Exprs{$1.expr(), $3.expr(), $5.expr()}}
  }
| a_expr NOT_LA ILIKE a_expr %prec NOT_LA
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.NotILike, Left: $1.expr(), Right: $4.expr()}
  }
| a_expr NOT_LA ILIKE a_expr ESCAPE a_expr %prec ESCAPE
 {
   $$.val = &tree.FuncExpr{Func: tree.WrapFunction("not_ilike_escape"), Exprs: tree.Exprs{$1.expr(), $4.expr(), $6.expr()}}
 }
| a_expr SIMILAR TO a_expr %prec SIMILAR
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.SimilarTo, Left: $1.expr(), Right: $4.expr()}
  }
| a_expr SIMILAR TO a_expr ESCAPE a_expr %prec ESCAPE
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("similar_to_escape"), Exprs: tree.Exprs{$1.expr(), $4.expr(), $6.expr()}}
  }
| a_expr NOT_LA SIMILAR TO a_expr %prec NOT_LA
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.NotSimilarTo, Left: $1.expr(), Right: $5.expr()}
  }
| a_expr NOT_LA SIMILAR TO a_expr ESCAPE a_expr %prec ESCAPE
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("not_similar_to_escape"), Exprs: tree.Exprs{$1.expr(), $5.expr(), $7.expr()}}
  }
| a_expr '~' a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.RegMatch, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr NOT_REGMATCH a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.NotRegMatch, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr REGIMATCH a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.RegIMatch, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr NOT_REGIMATCH a_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.NotRegIMatch, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr IS NAN %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.EQ, Left: $1.expr(), Right: tree.NewStrVal("NaN")}
  }
| a_expr IS NOT NAN %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.NE, Left: $1.expr(), Right: tree.NewStrVal("NaN")}
  }
| a_expr IS NULL %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsNotDistinctFrom, Left: $1.expr(), Right: tree.DNull}
  }
| a_expr ISNULL %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsNotDistinctFrom, Left: $1.expr(), Right: tree.DNull}
  }
| a_expr IS NOT NULL %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsDistinctFrom, Left: $1.expr(), Right: tree.DNull}
  }
| a_expr NOTNULL %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsDistinctFrom, Left: $1.expr(), Right: tree.DNull}
  }
| row OVERLAPS row { return unimplemented(sqllex, "overlaps") }
| a_expr IS TRUE %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsNotDistinctFrom, Left: $1.expr(), Right: tree.MakeDBool(true)}
  }
| a_expr IS NOT TRUE %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsDistinctFrom, Left: $1.expr(), Right: tree.MakeDBool(true)}
  }
| a_expr IS FALSE %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsNotDistinctFrom, Left: $1.expr(), Right: tree.MakeDBool(false)}
  }
| a_expr IS NOT FALSE %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsDistinctFrom, Left: $1.expr(), Right: tree.MakeDBool(false)}
  }
| a_expr IS UNKNOWN %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsNotDistinctFrom, Left: $1.expr(), Right: tree.DNull}
  }
| a_expr IS NOT UNKNOWN %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsDistinctFrom, Left: $1.expr(), Right: tree.DNull}
  }
| a_expr IS DISTINCT FROM a_expr %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsDistinctFrom, Left: $1.expr(), Right: $5.expr()}
  }
| a_expr IS NOT DISTINCT FROM a_expr %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsNotDistinctFrom, Left: $1.expr(), Right: $6.expr()}
  }
| a_expr IS OF '(' type_list ')' %prec IS
  {
    $$.val = &tree.IsOfTypeExpr{Expr: $1.expr(), Types: $5.colTypes()}
  }
| a_expr IS NOT OF '(' type_list ')' %prec IS
  {
    $$.val = &tree.IsOfTypeExpr{Not: true, Expr: $1.expr(), Types: $6.colTypes()}
  }
| a_expr BETWEEN opt_asymmetric b_expr AND a_expr %prec BETWEEN
  {
    $$.val = &tree.RangeCond{Left: $1.expr(), From: $4.expr(), To: $6.expr()}
  }
| a_expr NOT_LA BETWEEN opt_asymmetric b_expr AND a_expr %prec NOT_LA
  {
    $$.val = &tree.RangeCond{Not: true, Left: $1.expr(), From: $5.expr(), To: $7.expr()}
  }
| a_expr BETWEEN SYMMETRIC b_expr AND a_expr %prec BETWEEN
  {
    $$.val = &tree.RangeCond{Symmetric: true, Left: $1.expr(), From: $4.expr(), To: $6.expr()}
  }
| a_expr NOT_LA BETWEEN SYMMETRIC b_expr AND a_expr %prec NOT_LA
  {
    $$.val = &tree.RangeCond{Not: true, Symmetric: true, Left: $1.expr(), From: $5.expr(), To: $7.expr()}
  }
| a_expr IN in_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.In, Left: $1.expr(), Right: $3.expr()}
  }
| a_expr NOT_LA IN in_expr %prec NOT_LA
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.NotIn, Left: $1.expr(), Right: $4.expr()}
  }
| a_expr subquery_op sub_type a_expr %prec CONCAT
  {
    op := $3.cmpOp()
    subOp := $2.op()
    subOpCmp, ok := subOp.(tree.ComparisonOperator)
    if !ok {
      sqllex.Error(fmt.Sprintf("%s %s <array> is invalid because %q is not a boolean operator",
        subOp, op, subOp))
      return 1
    }
    $$.val = &tree.ComparisonExpr{
      Operator: op,
      SubOperator: subOpCmp,
      Left: $1.expr(),
      Right: $4.expr(),
    }
  }
| DEFAULT
  {
    $$.val = tree.DefaultVal{}
  }
| MAXVALUE
  {
    $$.val = tree.MaxVal{}
  }
| MINVALUE
  {
    $$.val = tree.MinVal{}
  }


| UNIQUE '(' error { return unimplemented(sqllex, "UNIQUE predicate") }








b_expr:
  c_expr
| b_expr TYPECAST cast_target
  {
    $$.val = &tree.CastExpr{Expr: $1.expr(), Type: $3.castTargetType(), SyntaxMode: tree.CastShort}
  }
| b_expr TYPEANNOTATE typename
  {
    $$.val = &tree.AnnotateTypeExpr{Expr: $1.expr(), Type: $3.colType(), SyntaxMode: tree.AnnotateShort}
  }
| '+' b_expr %prec UMINUS
  {
    $$.val = $2.expr()
  }
| '-' b_expr %prec UMINUS
  {
    $$.val = unaryNegation($2.expr())
  }
| '~' b_expr %prec UMINUS
  {
    $$.val = &tree.UnaryExpr{Operator: tree.UnaryComplement, Expr: $2.expr()}
  }
| b_expr '+' b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Plus, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '-' b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Minus, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '*' b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Mult, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '/' b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Div, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr FLOORDIV b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.FloorDiv, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '%' b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Mod, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '^' b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Pow, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '#' b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Bitxor, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '&' b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Bitand, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '|' b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Bitor, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '<' b_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.LT, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '>' b_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.GT, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr '=' b_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.EQ, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr CONCAT b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.Concat, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr LSHIFT b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.LShift, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr RSHIFT b_expr
  {
    $$.val = &tree.BinaryExpr{Operator: tree.RShift, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr LESS_EQUALS b_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.LE, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr GREATER_EQUALS b_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.GE, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr NOT_EQUALS b_expr
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.NE, Left: $1.expr(), Right: $3.expr()}
  }
| b_expr IS DISTINCT FROM b_expr %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsDistinctFrom, Left: $1.expr(), Right: $5.expr()}
  }
| b_expr IS NOT DISTINCT FROM b_expr %prec IS
  {
    $$.val = &tree.ComparisonExpr{Operator: tree.IsNotDistinctFrom, Left: $1.expr(), Right: $6.expr()}
  }
| b_expr IS OF '(' type_list ')' %prec IS
  {
    $$.val = &tree.IsOfTypeExpr{Expr: $1.expr(), Types: $5.colTypes()}
  }
| b_expr IS NOT OF '(' type_list ')' %prec IS
  {
    $$.val = &tree.IsOfTypeExpr{Not: true, Expr: $1.expr(), Types: $6.colTypes()}
  }








c_expr:
  d_expr
| d_expr array_subscripts
  {
    $$.val = &tree.IndirectionExpr{
      Expr: $1.expr(),
      Indirection: $2.arraySubscripts(),
    }
  }
| case_expr
| EXISTS select_with_parens
  {
    $$.val = &tree.Subquery{Select: $2.selectStmt(), Exists: true}
  }































d_expr:
  ICONST
  {
    $$.val = $1.numVal()
  }
| FCONST
  {
    $$.val = $1.numVal()
  }
| SCONST
  {
    $$.val = tree.NewStrVal($1)
  }
| BCONST
  {
    $$.val = tree.NewBytesStrVal($1)
  }
| func_name '(' expr_list opt_sort_clause_err ')' SCONST { return unimplemented(sqllex, "func const") }
| const_typename SCONST
  {
    $$.val = &tree.CastExpr{Expr: tree.NewStrVal($2), Type: $1.colType(), SyntaxMode: tree.CastPrepend}
  }
| interval
  {
    $$.val = $1.expr()
  }
| const_interval '(' ICONST ')' SCONST { return unimplemented(sqllex, "expr_const const_interval") }
| TRUE
  {
    $$.val = tree.MakeDBool(true)
  }
| FALSE
  {
    $$.val = tree.MakeDBool(false)
  }
| NULL
  {
    $$.val = tree.DNull
  }
| column_path_with_star
  {
    $$.val = tree.Expr($1.unresolvedName())
  }
| '@' iconst64
  {
    colNum := $2.int64()
    if colNum < 1 || colNum > int64(MaxInt) {
      sqllex.Error(fmt.Sprintf("invalid column ordinal: @%d", colNum))
      return 1
    }
    $$.val = tree.NewOrdinalReference(int(colNum-1))
  }
| PLACEHOLDER
  {
    $$.val = tree.NewPlaceholder($1)
  }

| '(' a_expr ')' '.' '*'
  {
    $$.val = &tree.TupleStar{Expr: $2.expr()}
  }
| '(' a_expr ')' '.' unrestricted_name
  {
    $$.val = &tree.ColumnAccessExpr{Expr: $2.expr(), ColName: $5 }
  }
| '(' a_expr ')'
  {
    $$.val = &tree.ParenExpr{Expr: $2.expr()}
  }
| func_expr
| select_with_parens %prec UMINUS
  {
    $$.val = &tree.Subquery{Select: $1.selectStmt()}
  }
| labeled_row
  {
    $$.val = $1.tuple()
  }
| ARRAY select_with_parens %prec UMINUS
  {
    $$.val = &tree.ArrayFlatten{Subquery: &tree.Subquery{Select: $2.selectStmt()}}
  }
| ARRAY row
  {
    $$.val = &tree.Array{Exprs: $2.tuple().Exprs}
  }
| ARRAY array_expr
  {
    $$.val = $2.expr()
  }
| GROUPING '(' expr_list ')' { return unimplemented(sqllex, "d_expr grouping") }

func_application:
  func_name '(' ')'
  {
    $$.val = &tree.FuncExpr{Func: $1.resolvableFuncRefFromName()}
  }
| func_name '(' expr_list opt_sort_clause_err ')'
  {
    $$.val = &tree.FuncExpr{Func: $1.resolvableFuncRefFromName(), Exprs: $3.exprs()}
  }
| func_name '(' VARIADIC a_expr opt_sort_clause_err ')' { return unimplemented(sqllex, "variadic") }
| func_name '(' expr_list ',' VARIADIC a_expr opt_sort_clause_err ')' { return unimplemented(sqllex, "variadic") }
| func_name '(' ALL expr_list opt_sort_clause_err ')'
  {
    $$.val = &tree.FuncExpr{Func: $1.resolvableFuncRefFromName(), Type: tree.AllFuncType, Exprs: $4.exprs()}
  }
| func_name '(' DISTINCT expr_list opt_sort_clause_err ')'
  {
    $$.val = &tree.FuncExpr{Func: $1.resolvableFuncRefFromName(), Type: tree.DistinctFuncType, Exprs: $4.exprs()}
  }
| func_name '(' '*' ')'
  {
    $$.val = &tree.FuncExpr{Func: $1.resolvableFuncRefFromName(), Exprs: tree.Exprs{tree.StarExpr()}}
  }
| func_name '(' error { return helpWithFunction(sqllex, $1.resolvableFuncRefFromName()) }








func_expr:
  func_application within_group_clause filter_clause over_clause
  {
    f := $1.expr().(*tree.FuncExpr)
    f.Filter = $3.expr()
    f.WindowDef = $4.windowDef()
    $$.val = f
  }
| func_expr_common_subexpr
  {
    $$.val = $1.expr()
  }





func_expr_windowless:
  func_application { $$.val = $1.expr() }
| func_expr_common_subexpr { $$.val = $1.expr() }


func_expr_common_subexpr:
  COLLATION FOR '(' a_expr ')' { return unimplemented(sqllex, "func_expr_common_subexpr collation for") }
| CURRENT_DATE
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1)}
  }
| CURRENT_SCHEMA
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1)}
  }


| CURRENT_CATALOG
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("current_database")}
  }
| CURRENT_TIMESTAMP
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1)}
  }
| CURRENT_TIME
  {
    return unimplementedWithIssueDetail(sqllex, 26097, "current_time")
  }
| CURRENT_USER
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1)}
  }


| CURRENT_ROLE
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("current_user")}
  }
| SESSION_USER
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("current_user")}
  }
| USER
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("current_user")}
  }
| CAST '(' a_expr AS cast_target ')'
  {
    $$.val = &tree.CastExpr{Expr: $3.expr(), Type: $5.castTargetType(), SyntaxMode: tree.CastExplicit}
  }
| ANNOTATE_TYPE '(' a_expr ',' typename ')'
  {
    $$.val = &tree.AnnotateTypeExpr{Expr: $3.expr(), Type: $5.colType(), SyntaxMode: tree.AnnotateExplicit}
  }
| IF '(' a_expr ',' a_expr ',' a_expr ')'
  {
    $$.val = &tree.IfExpr{Cond: $3.expr(), True: $5.expr(), Else: $7.expr()}
  }
| IFERROR '(' a_expr ',' a_expr ',' a_expr ')'
  {
    $$.val = &tree.IfErrExpr{Cond: $3.expr(), Else: $5.expr(), ErrCode: $7.expr()}
  }
| IFERROR '(' a_expr ',' a_expr ')'
  {
    $$.val = &tree.IfErrExpr{Cond: $3.expr(), Else: $5.expr()}
  }
| ISERROR '(' a_expr ')'
  {
    $$.val = &tree.IfErrExpr{Cond: $3.expr()}
  }
| ISERROR '(' a_expr ',' a_expr ')'
  {
    $$.val = &tree.IfErrExpr{Cond: $3.expr(), ErrCode: $5.expr()}
  }
| NULLIF '(' a_expr ',' a_expr ')'
  {
    $$.val = &tree.NullIfExpr{Expr1: $3.expr(), Expr2: $5.expr()}
  }
| IFNULL '(' a_expr ',' a_expr ')'
  {
    $$.val = &tree.CoalesceExpr{Name: "IFNULL", Exprs: tree.Exprs{$3.expr(), $5.expr()}}
  }
| COALESCE '(' expr_list ')'
  {
    $$.val = &tree.CoalesceExpr{Name: "COALESCE", Exprs: $3.exprs()}
  }
| special_function

special_function:
  CURRENT_DATE '(' ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1)}
  }
| CURRENT_DATE '(' error { return helpWithFunctionByName(sqllex, $1) }
| CURRENT_SCHEMA '(' ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1)}
  }
| CURRENT_SCHEMA '(' error { return helpWithFunctionByName(sqllex, $1) }
| CURRENT_TIMESTAMP '(' ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1)}
  }
| CURRENT_TIMESTAMP '(' error { return helpWithFunctionByName(sqllex, $1) }
| CURRENT_TIME '(' ')'
  {
    return unimplementedWithIssueDetail(sqllex, 26097, "current_time")
  }
| CURRENT_TIME '(' error { return helpWithFunctionByName(sqllex, $1) }
| CURRENT_USER '(' ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1)}
  }
| CURRENT_USER '(' error { return helpWithFunctionByName(sqllex, $1) }
| EXTRACT '(' extract_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1), Exprs: $3.exprs()}
  }
| EXTRACT '(' error { return helpWithFunctionByName(sqllex, $1) }
| EXTRACT_DURATION '(' extract_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1), Exprs: $3.exprs()}
  }
| EXTRACT_DURATION '(' error { return helpWithFunctionByName(sqllex, $1) }
| OVERLAY '(' overlay_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1), Exprs: $3.exprs()}
  }
| OVERLAY '(' error { return helpWithFunctionByName(sqllex, $1) }
| POSITION '(' position_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("strpos"), Exprs: $3.exprs()}
  }
| SUBSTRING '(' substr_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1), Exprs: $3.exprs()}
  }
| SUBSTRING '(' error { return helpWithFunctionByName(sqllex, $1) }
| TREAT '(' a_expr AS typename ')' { return unimplemented(sqllex, "treat") }
| TRIM '(' BOTH trim_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("btrim"), Exprs: $4.exprs()}
  }
| TRIM '(' LEADING trim_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("ltrim"), Exprs: $4.exprs()}
  }
| TRIM '(' TRAILING trim_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("rtrim"), Exprs: $4.exprs()}
  }
| TRIM '(' trim_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction("btrim"), Exprs: $3.exprs()}
  }
| GREATEST '(' expr_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1), Exprs: $3.exprs()}
  }
| GREATEST '(' error { return helpWithFunctionByName(sqllex, $1) }
| LEAST '(' expr_list ')'
  {
    $$.val = &tree.FuncExpr{Func: tree.WrapFunction($1), Exprs: $3.exprs()}
  }
| LEAST '(' error { return helpWithFunctionByName(sqllex, $1) }



within_group_clause:
WITHIN GROUP '(' sort_clause ')' { return unimplemented(sqllex, "within group") }
|   {}

filter_clause:
  FILTER '(' WHERE a_expr ')'
  {
    $$.val = $4.expr()
  }
|
  {
    $$.val = tree.Expr(nil)
  }


window_clause:
  WINDOW window_definition_list
  {
    $$.val = $2.window()
  }
|
  {
    $$.val = tree.Window(nil)
  }

window_definition_list:
  window_definition
  {
    $$.val = tree.Window{$1.windowDef()}
  }
| window_definition_list ',' window_definition
  {
    $$.val = append($1.window(), $3.windowDef())
  }

window_definition:
  window_name AS window_specification
  {
    n := $3.windowDef()
    n.Name = tree.Name($1)
    $$.val = n
  }

over_clause:
  OVER window_specification
  {
    $$.val = $2.windowDef()
  }
| OVER window_name
  {
    $$.val = &tree.WindowDef{Name: tree.Name($2)}
  }
|
  {
    $$.val = (*tree.WindowDef)(nil)
  }

window_specification:
  '(' opt_existing_window_name opt_partition_clause
    opt_sort_clause opt_frame_clause ')'
  {
    $$.val = &tree.WindowDef{
      RefName: tree.Name($2),
      Partitions: $3.exprs(),
      OrderBy: $4.orderBy(),
      Frame: $5.windowFrame(),
    }
  }









opt_existing_window_name:
  name
|   %prec CONCAT
  {
    $$ = ""
  }

opt_partition_clause:
  PARTITION BY expr_list
  {
    $$.val = $3.exprs()
  }
|
  {
    $$.val = tree.Exprs(nil)
  }






opt_frame_clause:
  RANGE frame_extent
  {
    $$.val = &tree.WindowFrame{
      Mode: tree.RANGE,
      Bounds: $2.windowFrameBounds(),
    }
  }
| ROWS frame_extent
  {
    $$.val = &tree.WindowFrame{
      Mode: tree.ROWS,
      Bounds: $2.windowFrameBounds(),
    }
  }
| GROUPS frame_extent
  {
    $$.val = &tree.WindowFrame{
      Mode: tree.GROUPS,
      Bounds: $2.windowFrameBounds(),
    }
  }
|
  {
    $$.val = (*tree.WindowFrame)(nil)
  }

frame_extent:
  frame_bound
  {
    startBound := $1.windowFrameBound()
    switch {
    case startBound.BoundType == tree.UnboundedFollowing:
      sqllex.Error("frame start cannot be UNBOUNDED FOLLOWING")
      return 1
    case startBound.BoundType == tree.OffsetFollowing:
      sqllex.Error("frame starting from following row cannot end with current row")
      return 1
    }
    $$.val = tree.WindowFrameBounds{StartBound: startBound}
  }
| BETWEEN frame_bound AND frame_bound
  {
    startBound := $2.windowFrameBound()
    endBound := $4.windowFrameBound()
    switch {
    case startBound.BoundType == tree.UnboundedFollowing:
      sqllex.Error("frame start cannot be UNBOUNDED FOLLOWING")
      return 1
    case endBound.BoundType == tree.UnboundedPreceding:
      sqllex.Error("frame end cannot be UNBOUNDED PRECEDING")
      return 1
    case startBound.BoundType == tree.CurrentRow && endBound.BoundType == tree.OffsetPreceding:
      sqllex.Error("frame starting from current row cannot have preceding rows")
      return 1
    case startBound.BoundType == tree.OffsetFollowing && endBound.BoundType == tree.OffsetPreceding:
      sqllex.Error("frame starting from following row cannot have preceding rows")
      return 1
    case startBound.BoundType == tree.OffsetFollowing && endBound.BoundType == tree.CurrentRow:
      sqllex.Error("frame starting from following row cannot have preceding rows")
      return 1
    }
    $$.val = tree.WindowFrameBounds{StartBound: startBound, EndBound: endBound}
  }




frame_bound:
  UNBOUNDED PRECEDING
  {
    $$.val = &tree.WindowFrameBound{BoundType: tree.UnboundedPreceding}
  }
| UNBOUNDED FOLLOWING
  {
    $$.val = &tree.WindowFrameBound{BoundType: tree.UnboundedFollowing}
  }
| CURRENT ROW
  {
    $$.val = &tree.WindowFrameBound{BoundType: tree.CurrentRow}
  }
| a_expr PRECEDING
  {
    $$.val = &tree.WindowFrameBound{
      OffsetExpr: $1.expr(),
      BoundType: tree.OffsetPreceding,
    }
  }
| a_expr FOLLOWING
  {
    $$.val = &tree.WindowFrameBound{
      OffsetExpr: $1.expr(),
      BoundType: tree.OffsetFollowing,
    }
  }








row:
  ROW '(' opt_expr_list ')'
  {
    $$.val = &tree.Tuple{Exprs: $3.exprs(), Row: true}
  }
| expr_tuple_unambiguous
  {
    $$.val = $1.tuple()
  }

labeled_row:
  row
| '(' row AS name_list ')'
  {
    t := $2.tuple()
    labels := $4.nameList()
    t.Labels = make([]string, len(labels))
    for i, l := range labels {
      t.Labels[i] = string(l)
    }
    $$.val = t
  }

sub_type:
  ANY
  {
    $$.val = tree.Any
  }
| SOME
  {
    $$.val = tree.Some
  }
| ALL
  {
    $$.val = tree.All
  }

math_op:
  '+' { $$.val = tree.Plus  }
| '-' { $$.val = tree.Minus }
| '*' { $$.val = tree.Mult  }
| '/' { $$.val = tree.Div   }
| FLOORDIV { $$.val = tree.FloorDiv }
| '%' { $$.val = tree.Mod    }
| '&' { $$.val = tree.Bitand }
| '|' { $$.val = tree.Bitor  }
| '^' { $$.val = tree.Pow }
| '#' { $$.val = tree.Bitxor }
| '<' { $$.val = tree.LT }
| '>' { $$.val = tree.GT }
| '=' { $$.val = tree.EQ }
| LESS_EQUALS    { $$.val = tree.LE }
| GREATER_EQUALS { $$.val = tree.GE }
| NOT_EQUALS     { $$.val = tree.NE }

subquery_op:
  math_op
| LIKE         { $$.val = tree.Like     }
| NOT_LA LIKE  { $$.val = tree.NotLike  }
| ILIKE        { $$.val = tree.ILike    }
| NOT_LA ILIKE { $$.val = tree.NotILike }




















expr_tuple1_ambiguous:
  '(' ')'
  {
    $$.val = &tree.Tuple{}
  }
| '(' tuple1_ambiguous_values ')'
  {
    $$.val = &tree.Tuple{Exprs: $2.exprs()}
  }

tuple1_ambiguous_values:
  a_expr
  {
    $$.val = tree.Exprs{$1.expr()}
  }
| a_expr ','
  {
    $$.val = tree.Exprs{$1.expr()}
  }
| a_expr ',' expr_list
  {
     $$.val = append(tree.Exprs{$1.expr()}, $3.exprs()...)
  }






expr_tuple_unambiguous:
  '(' ')'
  {
    $$.val = &tree.Tuple{}
  }
| '(' tuple1_unambiguous_values ')'
  {
    $$.val = &tree.Tuple{Exprs: $2.exprs()}
  }

tuple1_unambiguous_values:
  a_expr ','
  {
    $$.val = tree.Exprs{$1.expr()}
  }
| a_expr ',' expr_list
  {
     $$.val = append(tree.Exprs{$1.expr()}, $3.exprs()...)
  }

opt_expr_list:
  expr_list
|
  {
    $$.val = tree.Exprs(nil)
  }

expr_list:
  a_expr
  {
    $$.val = tree.Exprs{$1.expr()}
  }
| expr_list ',' a_expr
  {
    $$.val = append($1.exprs(), $3.expr())
  }

type_list:
  typename
  {
    $$.val = []coltypes.T{$1.colType()}
  }
| type_list ',' typename
  {
    $$.val = append($1.colTypes(), $3.colType())
  }

array_expr:
  '[' opt_expr_list ']'
  {
    $$.val = &tree.Array{Exprs: $2.exprs()}
  }
| '[' array_expr_list ']'
  {
    $$.val = &tree.Array{Exprs: $2.exprs()}
  }

array_expr_list:
  array_expr
  {
    $$.val = tree.Exprs{$1.expr()}
  }
| array_expr_list ',' array_expr
  {
    $$.val = append($1.exprs(), $3.expr())
  }

extract_list:
  extract_arg FROM a_expr
  {
    $$.val = tree.Exprs{tree.NewStrVal($1), $3.expr()}
  }
| expr_list
  {
    $$.val = $1.exprs()
  }



extract_arg:
  IDENT
| YEAR
| MONTH
| DAY
| HOUR
| MINUTE
| SECOND






overlay_list:
  a_expr overlay_placing substr_from substr_for
  {
    $$.val = tree.Exprs{$1.expr(), $2.expr(), $3.expr(), $4.expr()}
  }
| a_expr overlay_placing substr_from
  {
    $$.val = tree.Exprs{$1.expr(), $2.expr(), $3.expr()}
  }
| expr_list
  {
    $$.val = $1.exprs()
  }

overlay_placing:
  PLACING a_expr
  {
    $$.val = $2.expr()
  }


position_list:
  b_expr IN b_expr
  {
    $$.val = tree.Exprs{$3.expr(), $1.expr()}
  }
|
  {
    $$.val = tree.Exprs(nil)
  }












substr_list:
  a_expr substr_from substr_for
  {
    $$.val = tree.Exprs{$1.expr(), $2.expr(), $3.expr()}
  }
| a_expr substr_for substr_from
  {
    $$.val = tree.Exprs{$1.expr(), $3.expr(), $2.expr()}
  }
| a_expr substr_from
  {
    $$.val = tree.Exprs{$1.expr(), $2.expr()}
  }
| a_expr substr_for
  {
    $$.val = tree.Exprs{$1.expr(), tree.NewDInt(1), $2.expr()}
  }
| opt_expr_list
  {
    $$.val = $1.exprs()
  }

substr_from:
  FROM a_expr
  {
    $$.val = $2.expr()
  }

substr_for:
  FOR a_expr
  {
    $$.val = $2.expr()
  }

trim_list:
  a_expr FROM expr_list
  {
    $$.val = append($3.exprs(), $1.expr())
  }
| FROM expr_list
  {
    $$.val = $2.exprs()
  }
| expr_list
  {
    $$.val = $1.exprs()
  }

in_expr:
  select_with_parens
  {
    $$.val = &tree.Subquery{Select: $1.selectStmt()}
  }
| expr_tuple1_ambiguous






case_expr:
  CASE case_arg when_clause_list case_default END
  {
    $$.val = &tree.CaseExpr{Expr: $2.expr(), Whens: $3.whens(), Else: $4.expr()}
  }

when_clause_list:

  when_clause
  {
    $$.val = []*tree.When{$1.when()}
  }
| when_clause_list when_clause
  {
    $$.val = append($1.whens(), $2.when())
  }

when_clause:
  WHEN a_expr THEN a_expr
  {
    $$.val = &tree.When{Cond: $2.expr(), Val: $4.expr()}
  }

case_default:
  ELSE a_expr
  {
    $$.val = $2.expr()
  }
|
  {
    $$.val = tree.Expr(nil)
  }

case_arg:
  a_expr
|
  {
    $$.val = tree.Expr(nil)
  }

array_subscript:
  '[' a_expr ']'
  {
    $$.val = &tree.ArraySubscript{Begin: $2.expr()}
  }
| '[' opt_slice_bound ':' opt_slice_bound ']'
  {
    $$.val = &tree.ArraySubscript{Begin: $2.expr(), End: $4.expr(), Slice: true}
  }

opt_slice_bound:
  a_expr
|
  {
    $$.val = tree.Expr(nil)
  }

array_subscripts:
  array_subscript
  {
    $$.val = tree.ArraySubscripts{$1.arraySubscript()}
  }
| array_subscripts array_subscript
  {
    $$.val = append($1.arraySubscripts(), $2.arraySubscript())
  }

opt_asymmetric:
  ASYMMETRIC {}
|   {}

target_list:
  target_elem
  {
    $$.val = tree.SelectExprs{$1.selExpr()}
  }
| target_list ',' target_elem
  {
    $$.val = append($1.selExprs(), $3.selExpr())
  }

target_elem:
  a_expr AS target_name
  {
    $$.val = tree.SelectExpr{Expr: $1.expr(), As: tree.UnrestrictedName($3)}
  }





| a_expr IDENT
  {
    $$.val = tree.SelectExpr{Expr: $1.expr(), As: tree.UnrestrictedName($2)}
  }
| a_expr
  {
    $$.val = tree.SelectExpr{Expr: $1.expr()}
  }
| '*'
  {
    $$.val = tree.StarSelectExpr()
  }



table_name_with_index_list:
  table_name_with_index
  {
    $$.val = tree.TableNameWithIndexList{$1.newTableWithIdx()}
  }
| table_name_with_index_list ',' table_name_with_index
  {
    $$.val = append($1.newTableWithIdxList(), $3.newTableWithIdx())
  }

table_pattern_list:
  table_pattern
  {
    $$.val = tree.TablePatterns{$1.unresolvedName()}
  }
| table_pattern_list ',' table_pattern
  {
    $$.val = append($1.tablePatterns(), $3.unresolvedName())
  }

table_name_with_index:
  table_name '@' index_name
  {
    $$.val = tree.TableNameWithIndex{
       Table: $1.normalizableTableNameFromUnresolvedName(),
       Index: tree.UnrestrictedName($3),
    }
  }
| table_name
  {


    $$.val = tree.TableNameWithIndex{
        Table: $1.normalizableTableNameFromUnresolvedName(),
        SearchTable: true,
    }
  }











table_pattern:
  simple_db_object_name
| complex_table_pattern



complex_table_pattern:
  complex_db_object_name
| name '.' unrestricted_name '.' '*'
  {
     $$.val = &tree.UnresolvedName{Star: true, NumParts: 3, Parts: tree.NameParts{"", $3, $1}}
  }
| name '.' '*'
  {
     $$.val = &tree.UnresolvedName{Star: true, NumParts: 2, Parts: tree.NameParts{"", $1}}
  }
| '*'
  {
     $$.val = &tree.UnresolvedName{Star: true, NumParts: 1}
  }

name_list:
  name
  {
    $$.val = tree.NameList{tree.Name($1)}
  }
| name_list ',' name
  {
    $$.val = append($1.nameList(), tree.Name($3))
  }


signed_iconst:
  ICONST
| '+' ICONST
  {
    $$.val = $2.numVal()
  }
| '-' ICONST
  {
    n := $2.numVal()
    n.Negative = true
    $$.val = n
  }




signed_iconst64:
  signed_iconst
  {
    val, err := $1.numVal().AsInt64()
    if err != nil {
      sqllex.Error(err.Error()); return 1
    }
    $$.val = val
  }


iconst64:
  ICONST
  {
    val, err := $1.numVal().AsInt64()
    if err != nil {
      sqllex.Error(err.Error()); return 1
    }
    $$.val = val
  }

interval:
  const_interval SCONST opt_interval
  {


    var err error
    var d tree.Datum
    if $3.val == nil {
      d, err = tree.ParseDInterval($2)
    } else {
      d, err = tree.ParseDIntervalWithField($2, $3.durationField())
    }
    if err != nil {
      sqllex.Error(err.Error())
      return 1
    }
    $$.val = d
  }































collation_name:      unrestricted_name

partition_name:      unrestricted_name

index_name:          unrestricted_name

opt_index_name:      opt_name

zone_name:           unrestricted_name

target_name:         unrestricted_name

constraint_name:     name

database_name:       name

column_name:         name

family_name:         name

opt_family_name:     opt_name

table_alias_name:    name

statistics_name:     name

window_name:         name

view_name:           table_name

type_name:           db_object_name

sequence_name:       db_object_name

table_name:          db_object_name

explain_option_name: non_reserved_word












column_path:
  name
  {
      $$.val = &tree.UnresolvedName{NumParts:1, Parts: tree.NameParts{$1}}
  }
| prefixed_column_path

prefixed_column_path:
  name '.' unrestricted_name
  {
      $$.val = &tree.UnresolvedName{NumParts:2, Parts: tree.NameParts{$3,$1}}
  }
| name '.' unrestricted_name '.' unrestricted_name
  {
      $$.val = &tree.UnresolvedName{NumParts:3, Parts: tree.NameParts{$5,$3,$1}}
  }
| name '.' unrestricted_name '.' unrestricted_name '.' unrestricted_name
  {
      $$.val = &tree.UnresolvedName{NumParts:4, Parts: tree.NameParts{$7,$5,$3,$1}}
  }








column_path_with_star:
  column_path
| name '.' unrestricted_name '.' unrestricted_name '.' '*'
  {
    $$.val = &tree.UnresolvedName{Star:true, NumParts:4, Parts: tree.NameParts{"",$5,$3,$1}}
  }
| name '.' unrestricted_name '.' '*'
  {
    $$.val = &tree.UnresolvedName{Star:true, NumParts:3, Parts: tree.NameParts{"",$3,$1}}
  }
| name '.' '*'
  {
    $$.val = &tree.UnresolvedName{Star:true, NumParts:2, Parts: tree.NameParts{"",$1}}
  }








func_name:
  type_function_name
  {
    $$.val = &tree.UnresolvedName{NumParts:1, Parts: tree.NameParts{$1}}
  }
| prefixed_column_path






db_object_name:
  simple_db_object_name
| complex_db_object_name



simple_db_object_name:
  name
  {
    $$.val = &tree.UnresolvedName{NumParts:1, Parts: tree.NameParts{$1}}
  }





complex_db_object_name:
  name '.' unrestricted_name
  {
    $$.val = &tree.UnresolvedName{NumParts:2, Parts: tree.NameParts{$3,$1}}
  }
| name '.' unrestricted_name '.' unrestricted_name
  {
    $$.val = &tree.UnresolvedName{NumParts:3, Parts: tree.NameParts{$5,$3,$1}}
  }



name:
  IDENT
| unreserved_keyword
| col_name_keyword

opt_name:
  name
|
  {
    $$ = ""
  }

opt_name_parens:
  '(' name ')'
  {
    $$ = $2
  }
|
  {
    $$ = ""
  }




non_reserved_word_or_sconst:
  non_reserved_word
| SCONST


type_function_name:
  IDENT
| unreserved_keyword
| type_func_name_keyword


non_reserved_word:
  IDENT
| unreserved_keyword
| col_name_keyword
| type_func_name_keyword




unrestricted_name:
  IDENT
| unreserved_keyword
| col_name_keyword
| type_func_name_keyword
| reserved_keyword









unreserved_keyword:
  ABORT
| ACTION
| ADD
| ADMIN
| AGGREGATE
| ALTER
| AT
| BACKUP
| BEGIN
| BIGSERIAL
| BLOB
| BOOL
| BY
| BYTEA
| BYTES
| CACHE
| CANCEL
| CASCADE
| CHANGEFEED
| CLUSTER
| COLUMNS
| COMMENT
| COMMIT
| COMMITTED
| COMPACT
| CONFLICT
| CONFIGURATION
| CONFIGURATIONS
| CONFIGURE
| CONSTRAINTS
| CONVERSION
| COPY
| COVERING
| CUBE
| CURRENT
| CYCLE
| DATA
| DATABASE
| DATABASES
| DATE
| DAY
| DEALLOCATE
| DELETE
| DISCARD
| DOMAIN
| DOUBLE
| DROP
| ENCODING
| ENUM
| ESCAPE
| EXECUTE
| EXPERIMENTAL
| EXPERIMENTAL_AUDIT
| EXPERIMENTAL_FINGERPRINTS
| EXPERIMENTAL_RANGES
| EXPERIMENTAL_RELOCATE
| EXPERIMENTAL_REPLICA
| EXPLAIN
| EXPORT
| EXTENSION
| FILES
| FILTER
| FIRST
| FLOAT4
| FLOAT8
| FOLLOWING
| FORCE_INDEX
| FUNCTION
| GLOBAL
| GRANTS
| GROUPS
| HIGH
| HISTOGRAM
| HOUR
| IMPORT
| INCREMENT
| INCREMENTAL
| INDEXES
| INET
| INJECT
| INSERT
| INT2
| INT2VECTOR
| INT4
| INT8
| INT64
| INTERLEAVE
| INVERTED
| ISOLATION
| JOB
| JOBS
| JSON
| JSONB
| KEY
| KEYS
| KV
| LANGUAGE
| LC_COLLATE
| LC_CTYPE
| LEASE
| LESS
| LEVEL
| LIST
| LOCAL
| LOW
| MATCH
| MATERIALIZED
| MINUTE
| MONTH
| NAMES
| NAN
| NAME
| NEXT
| NO
| NORMAL
| NO_INDEX_JOIN
| OF
| OFF
| OID
| OIDVECTOR
| OPERATOR
| OPTION
| OPTIONS
| ORDINALITY
| OVER
| OWNED
| PARENT
| PARTIAL
| PARTITION
| PASSWORD
| PAUSE
| PHYSICAL
| PLANS
| PRECEDING
| PREPARE
| PRIORITY
| PUBLICATION
| QUERIES
| QUERY
| RANGE
| RANGES
| READ
| RECURSIVE
| REF
| REGCLASS
| REGPROC
| REGPROCEDURE
| REGNAMESPACE
| REGTYPE
| RELEASE
| RENAME
| REPEATABLE
| REPLACE
| RESET
| RESTORE
| RESTRICT
| RESUME
| REVOKE
| ROLE
| ROLES
| ROLLBACK
| ROLLUP
| ROWS
| RULE
| SETTING
| SETTINGS
| STATUS
| SAVEPOINT
| SCATTER
| SCHEMA
| SCHEMAS
| SCRUB
| SEARCH
| SECOND
| SERIAL
| SERIALIZABLE
| SERIAL2
| SERIAL4
| SERIAL8
| SERVER
| SEQUENCE
| SEQUENCES
| SESSION
| SESSIONS
| SET
| SHOW
| SIMPLE
| SMALLSERIAL
| SNAPSHOT
| SQL
| START
| STATISTICS
| STDIN
| STORE
| STORED
| STORING
| STRICT
| STRING
| SPLIT
| SUBSCRIPTION
| SYNTAX
| SYSTEM
| TABLES
| TEMP
| TEMPLATE
| TEMPORARY
| TESTING_RANGES
| TESTING_RELOCATE
| TEXT
| TIMESTAMPTZ
| TRACE
| TRANSACTION
| TRIGGER
| TRUNCATE
| TRUSTED
| TYPE
| UNBOUNDED
| UNCOMMITTED
| UNKNOWN
| UNLOGGED
| UPDATE
| UPSERT
| UUID
| USE
| USERS
| VALID
| VALIDATE
| VALUE
| VARYING
| VIEW
| WITHIN
| WITHOUT
| WRITE
| YEAR
| ZONE










col_name_keyword:
  ANNOTATE_TYPE
| BETWEEN
| BIGINT
| BIT
| BOOLEAN
| CHAR
| CHARACTER
| CHARACTERISTICS
| COALESCE
| DEC
| DECIMAL
| EXISTS
| EXTRACT
| EXTRACT_DURATION
| FLOAT
| GREATEST
| GROUPING
| IF
| IFERROR
| IFNULL
| INT
| INTEGER
| INTERVAL
| ISERROR
| LEAST
| NULLIF
| NUMERIC
| OUT
| OVERLAY
| POSITION
| PRECISION
| REAL
| ROW
| SMALLINT
| SUBSTRING
| TIME
| TIMETZ
| TIMESTAMP
| TREAT
| TRIM
| VALUES
| VARCHAR
| VIRTUAL
| WORK












type_func_name_keyword:
  COLLATION
| CROSS
| FAMILY
| FULL
| INNER
| ILIKE
| IS
| ISNULL
| JOIN
| LEFT
| LIKE
| MAXVALUE
| MINVALUE
| NATURAL
| NOTNULL
| OUTER
| OVERLAPS
| RIGHT
| SIMILAR





reserved_keyword:
  ALL
| ANALYSE
| ANALYZE
| AND
| ANY
| ARRAY
| AS
| ASC
| ASYMMETRIC
| BOTH
| CASE
| CAST
| CHECK
| COLLATE
| COLUMN
| CONSTRAINT
| CREATE
| CURRENT_CATALOG
| CURRENT_DATE
| CURRENT_ROLE
| CURRENT_SCHEMA
| CURRENT_TIME
| CURRENT_TIMESTAMP
| CURRENT_USER
| DEFAULT
| DEFERRABLE
| DESC
| DISTINCT
| DO
| ELSE
| END
| EXCEPT
| FALSE
| FETCH
| FOR
| FOREIGN
| FROM
| GRANT
| GROUP
| HAVING
| IN
| INDEX
| INITIALLY
| INTERSECT
| INTO
| LATERAL
| LEADING
| LIMIT
| LOCALTIME
| LOCALTIMESTAMP
| NOT
| NOTHING
| NULL
| OFFSET
| ON
| ONLY
| OR
| ORDER
| PLACING
| PRIMARY
| REFERENCES
| RETURNING
| SELECT
| SESSION_USER
| SOME
| SYMMETRIC
| TABLE
| THEN
| TO
| TRAILING
| TRUE
| UNION
| UNIQUE
| USER
| USING
| VARIADIC
| WHEN
| WHERE
| WINDOW
| WITH

%%
