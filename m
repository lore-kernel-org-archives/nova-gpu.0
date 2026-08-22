Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898E2F693B
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363796; cv=fail; b=o5KrQ2ihPOXYK2sOfOwqywX30egAO0JcVGrDncZzxyCeClRKzU9J+LfkUVrr0L3Slys7si2vUEhVJnoSd/HF0mtZcSVYQSqdNNq+4JLnQt8FZvNm6CSVqQj7mvEpfrM6GB3jyIPdRLUxuxAGhMyQmE2GldpFqsfVFFTQsRi7hdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363796; c=relaxed/simple;
	bh=9B+i0m3wJAS2eonfEMoT1BXbMtN5d6IbsQ8Vb4zDwwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s1UK8viDnM2cGuPxIfQDRtbpOG8BGnlcAHN5XIrelgCb7vRodVyo8A2PECnmuVC5UiWlzIuQvlGS18qU9NnhPcMrtvp1ruE6N/g8RyISvGFKkRFyJZHyEV+qkrplSZXs1o7qCVrNA1P0AIt4ptndaEc8qwBriPi84YqRLX9Q06g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W2H/gl5+; arc=fail smtp.client-ip=52.101.43.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W2H/gl5+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfOXoM0v0bpWz7h9pFS30N2asoo2mV+6a/uyGhS+be/qd8ImYLLOVsaUZXQqjGwwe5DlYdsNYRay+ysMFWdCRGmK0BJcJSHiWMxNsHJvpwkrDN3TADq+RswbXlwV1Sx8Js+N2MqmJzqadOsYR3qu6Qk8iCKpBpGxwVSOjLmYcG7e0+/7NoVfy5pZv0crjOg82ejtTXETDZy3Ai4SMeBpys4S7DurZhY2XoTM8gfQypKo7MuicDVwAvil5KmiGyUxR3pc8RARfYXNcCvjS/EnAlMGWREn4zm3cCeJZMgerMi0hY/R3zwJVCI+HFiwS94fa9gl0oPO2ySq9QASeKPCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6l2O6WlyXRtRXdkRwoNrxmunC+DsUZiJHvgpQwlXQEc=;
 b=P3m94P2BzDeCv5bf5Yq53wjCPbtp8OeSPBXynqrqkzLyj37y6XY10Ihij5/KGrjaGilcw2vqQJE/A61kRdrA/ZnuJoenP5B23Tv3Ge5Ap5P4C4WjHw62aqRbHtlhuFxio3bG8RkX3xhz6RKyvhoXuEWVLeboaReJzjJSMPT1p3cMGm51a3iotxM29asaZN1fjpJREidzwIz6CX9//yZnbFwNV0Nav+cH7MceSsLlxYaNXxG08An13ZHDRqUKQN6ZcvxQkC4GpwAkEKrE1HN0uMOOFS7e7INz352ZWDFHuNPVv9m+VUdRFTw2QiqVQIc95WT9MGdc7EimI5wB3uYg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6l2O6WlyXRtRXdkRwoNrxmunC+DsUZiJHvgpQwlXQEc=;
 b=W2H/gl5+YZZtelgs8abA/GbTwpKv6O0i7Ee8DvRFexFjY5LKoLPd4xYtZQSAVT6s/p0mN/HRMWMAtoabFcX+OHAduYTWMcRO/YvJy8SPXDvFIM0pNjlP4nV1aEzyN7TS9QEAMgUQP51hQb9rx8Rm7JA5POzpO2XeNmEn7cjz7NBnlsXF01CY6EGQekaOoSCAjDAuFn/J8ONeodiAB6a0BsGFEv6eD5qy9ckZ8Peu7JfdtTngvdGH5Weqq3L49nyRcfpOFAyVVos0f8avkagKRtsRJ9ODoOPy8GVhO6vWEl51S01RqjZ417XfSL4dDAyApBtAUfMabGPGIBR8lljDGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:56:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:56:31 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 30/31] gpu: nova-core: print GMC command names in debug logs
Date: Fri, 21 Aug 2026 18:54:47 -0700
Message-ID: <20260822015448.238214-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:217::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 109c8621-97a4-41a2-a63c-08defff0960e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vO2+PqsGWd206zjVdIQHkBTNu4re4c0rZFp0cNMUHS4QinwzoOJNU7EmdyarOC36SfgA+nPdOxEWrHAzhTqy4AHBJzTKeHrYNcyoswlfMafKcR3LxaAgP294LMhHKxm1m2HBrE+ncclPnI383tsgt6OAVt1uaGqiWrlHGah40pLxad/IRPyvKXlm5/rXHABR3OGmAhWdUpiDLbA6aRqjFp62G41R6YCJuIiZfYIjl+RJp+f+c0jAwfNWkTOlcX8C/HQnX0mvZrxCE+A+7Yh5t7kB4rkaglBCLMbOgy7wFvho/2n6rJYCpgcqauApLVnq5JhBKWZspYCrBXmyTesdupNrxNVWG4yFn4vh4bwTCihAkcTRz4HjjyamIA2a56kZWrvU2UDw8ATVcHWPYQpHq7lV77oLxpZs1pxBXkDZvNJedSnF4JTkHLZ823qX/P2GEMUUB5GM9nXa5pjPukFcZO3PgTEmQTC+unAOnU4OhR9el0bpgEt/G9f641gkquyNtTUhoZhf/edOwlN6/7VxNgbDnGjTpJkq4xFj4lecAAJ/zAWKNbgwPvapGTmefGTzQmGVINa23iZuNhL8wKdM2Z58GHlqJeHUuGB1fmVhGXpsyRDMz8FYxiYxKqbRi/MhR1JxD7mlGMsXMSImDfaGve3nA0VUIHvPe1AfEQ+e+N4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rwxtG6jUA5X4TulkXPu5a2/E/uKB9g2NonzZH3o8BRBe5QESdzJM1MDkynuC?=
 =?us-ascii?Q?PXqHmDKxt9AvzlxUs95mS30AvA3YZjA0ZC/XxMhakxr51+5Yz1q/7doX7+kA?=
 =?us-ascii?Q?WBu8OVO8KK3IEpo1FaxAZiysBU20ARxTtx142zmRrvVNv0ZxtHfQYAicGRQK?=
 =?us-ascii?Q?OMEZZkJ5+4dSDArTMTidcwuEiLsbsh5h+63/yGH4F1ODlN/zBceorAz38NqK?=
 =?us-ascii?Q?rbZsMzP8wuMhRRmeAce9tMkMpC+5a7Goh+1A5V64djkRN5d5LjxNTUNxQD/W?=
 =?us-ascii?Q?OyKYu+6KHChJvA9u54l6ACUW1036z1NKWHuAUovBDT3XN71DktCSn7T6FBxL?=
 =?us-ascii?Q?ou+UjiHMZGckWLovgQMJj/6gxfACjrzGfkPEofJ7uW7PGXjaFO4DE0xp9Nvn?=
 =?us-ascii?Q?BrPMP/Qq+OVJpz0KgfpQCfU0gvhqMJTJLKNkmLKRAMoh4I2uf1iUo6Hu6Jxe?=
 =?us-ascii?Q?ulnxXs2A3AgbAIF4nmfUEHWBJ1Akrrs7AhYnzf2A3+znObrnX/BmgdTyn2IC?=
 =?us-ascii?Q?Wx8rLSlWdgToI5zQEBTWNbQylp/QFiow5ECVSwFAoC+s832x4gwScXvDQjZd?=
 =?us-ascii?Q?51dU2MoTt4tJWSJ9MyiAOLI+abUX27NimXJRv+0N4xRJfhtyb+bBK02HmqIE?=
 =?us-ascii?Q?qKpfdOgEBgUtctIJ02YbY8GcVipnNPpKnBhTMe+KOSDG+xhD19oKWUqK63St?=
 =?us-ascii?Q?YpeUeYVNG+4lh8VBhllc0eUSSvE/2XCeXbERb1XaUYhP7HsFBWZj9JzrHr/2?=
 =?us-ascii?Q?SpN1pJQ+oP8zpjZZIXi4Zvny3cQoLKuxRtndb1eEciytVjas8wmqe0R8xOV9?=
 =?us-ascii?Q?gCW3TRR7fs3WC1lETLLkASZSQg7NTele6IBwFwvRk18t5ZpAyScRE8X5LHJ1?=
 =?us-ascii?Q?cGj/ObAJKhF+Uc5TpO6CJ29stLekOLq02UG9Z9fPiyKqmasKXSMO+dpkrbwl?=
 =?us-ascii?Q?11L7XDQB/KlDCQ9m6dC7pCTjCqfCE2Ms+q886Ro/Nt/h7FApE+ZZ+zL/3oAp?=
 =?us-ascii?Q?Jz+py/KM3XYf+In2YNbqWKw3VpLY8EZO/wQFOndr7qb7FKplGzs6C1in6Xv+?=
 =?us-ascii?Q?HT2H4vo+7CE7XKKmVQXZqI1USYquRJsb4g0E3bqztG1HCYz01ZAm89rKbdx+?=
 =?us-ascii?Q?I51bma54IeJuCLX5xEMbVRCriUqUVnihDJ1P0UH07UqcKStyJUdZQR+H51Cg?=
 =?us-ascii?Q?XeuXI/CkLADeVUuQk23mrjqOPHW/uluL2Nq/qFxYN6mUg/fGe3sJXjsFfO1q?=
 =?us-ascii?Q?TaOGILI5aqGCsHhpLgpM26dITR6GofqyCwg5pXaCM3A83CtyrdOQuYviv6mg?=
 =?us-ascii?Q?YxYOGf7a+8T0xn8jLQKvwUjnQuyeLY3fP0SSv3ovnbf5CjvogEhHBfDML84C?=
 =?us-ascii?Q?UKuLfbzJiZKy9726p6GIIUrwRsZU56HleqZt3E4gcJXVvjIte8GsaTJxphnZ?=
 =?us-ascii?Q?ykKejvSkY4jb+j0aT4Tq2yS6l8EJhfqRqHPOPeqmQoD65PwWXZ65Ijf4JmnE?=
 =?us-ascii?Q?k42PBUovcSOKFM6d0uZ4imSoraeJs5t1zg/5OpexlLHXRAotkpveUMh694Sn?=
 =?us-ascii?Q?omMS7hOQTGj34mm/B8rLkgLyzW3eoMcOeG+6TM5DZRSI6J+RYYtcH/8VkuPc?=
 =?us-ascii?Q?O7SXFF7q49lOtlsAkfDSgrUUMn39NpcuWmQ5ZwgcIup770un0K/lJGt0AzfN?=
 =?us-ascii?Q?tsSoc67zaIlBYJyBPw2mKlBDBHPkOEPDdBbNYRwjrKWW+YWRR8TS5kuPlc8w?=
 =?us-ascii?Q?Qjf120oPcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109c8621-97a4-41a2-a63c-08defff0960e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:56:30.9423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODuKjsTV2PWi2brr1bawAIt5xpnavsSuge1vegSHCscpkV5w1iOsd8OKTUgtHaG1AL6z6i3PsNOD/OoClBt6og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

Each GMC command has a name and a numeric ID.

Nova-core has been printing a bare numeric ID for GMC send and receive
debug lines. For example, 0x10001 instead of GSP_INIT.

Add Display formatting and decoding, so that we print the command name,
in addition to the ID. Example output:

nova-core 0000:c2:00.0: GSP GMC: send: seq# 0, command=GSP_INIT (0x10001), length=0xf8
nova-core 0000:c2:00.0: GSP GMC: event: seq# 0, command=GSP_INIT (0x10001), length=0x550

Assisted-by: Cursor:grok-4.6
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs |  5 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs |  9 +++--
 drivers/gpu/nova-core/gsp/fw.rs   | 67 +++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index e66e8e454e27..51c5b2522408 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -45,6 +45,7 @@
         commands,
         fw::{
             BindataArgs,
+            GmcCommand,
             GspArgumentsPadded,
             GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER,
             GMCAPI_CMD_EXEC_HS_BINARY, //
@@ -278,8 +279,8 @@ fn dispatch_gmc_boot_event(
             _ => {
                 dev_err!(
                     dev,
-                    "Unexpected GMC boot event: command_id={:#010x}\n",
-                    command_id
+                    "Unexpected GMC boot event: command={}\n",
+                    GmcCommand(command_id)
                 );
                 Err(EINVAL)
             }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index fb7f000a5a7d..8e97cc71f2b6 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -52,6 +52,7 @@
     driver::Bar0,
     gsp::{
         fw::{
+            GmcCommand,
             GspGmcMsgElement,
             GspMsgElement,
             MsgFunction,
@@ -898,9 +899,9 @@ fn send_gmc(
 
         dev_dbg!(
             &self.dev,
-            "GSP GMC: send: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+            "GSP GMC: send: seq# {}, command={}, length=0x{:x}\n",
             rpc_seq,
-            command_id,
+            GmcCommand(command_id),
             dst.header.length(),
         );
 
@@ -1301,9 +1302,9 @@ fn receive_gmc_and_dispatch<R>(
 
             dev_dbg!(
                 &self.dev,
-                "GSP GMC: event: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+                "GSP GMC: event: seq# {}, command={}, length=0x{:x}\n",
                 header.gmc.sequence,
-                command_id,
+                GmcCommand(command_id),
                 length,
             );
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4f34c246cb3f..927332203a43 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -12,6 +12,7 @@
 use kernel::{
     bitfield,
     dma::Coherent,
+    fmt,
     io::io_write,
     prelude::*,
     ptr::{
@@ -722,6 +723,72 @@ unsafe impl AsBytes for GmcApiHeader {}
 // SAFETY: All fields are integer types for which all bit patterns are valid.
 unsafe impl FromBytes for GmcApiHeader {}
 
+/// [`fmt::Display`] writes the command name and the numeric id, for example
+/// `GSP_INIT (0x10001)`. An unrecognized id writes `UNKNOWN` and the same numeric form.
+#[derive(Copy, Clone)]
+pub(crate) struct GmcCommand(pub(crate) u32);
+
+impl GmcCommand {
+    fn name(self) -> &'static str {
+        match self.0 {
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT => "GSP_INIT",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER => {
+                "EXEC_GENERIC_BOOTLOADER"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY => "EXEC_HS_BINARY",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND => "GSP_SUSPEND",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_RESUME_DONE => "GSP_RESUME_DONE",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_ADD_VGPU_TYPE => "ADD_VGPU_TYPE",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_SUPPORTED_VGPU_TYPES => {
+                "QUERY_SUPPORTED_VGPU_TYPES"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_CREATABLE_VGPU_TYPES => {
+                "QUERY_CREATABLE_VGPU_TYPES"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_ASSIGN_VGPU_TYPE => "ASSIGN_VGPU_TYPE",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_DEASSIGN_VGPU_TYPE => "DEASSIGN_VGPU_TYPE",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES => "QUERY_VGPU_PROPERTIES",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE => {
+                "QUERY_ASSIGNED_VF_VGPU_TYPE"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK => {
+                "BOOTLOAD_GSP_VGPU_PLUGIN_TASK"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK => {
+                "SHUTDOWN_GSP_VGPU_PLUGIN_TASK"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE => {
+                "SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES => {
+                "CLEANUP_GSP_VGPU_PLUGIN_RESOURCES"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_PLUGIN_TRIGGERED_EVENT => {
+                "VGPU_PLUGIN_TRIGGERED_EVENT"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB => {
+                "VGPU_MGR_SCRUB_GUEST_FB"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS => {
+                "VGPU_MGR_ALLOC_GSP_CEUTILS"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS => {
+                "VGPU_MGR_FREE_GSP_CEUTILS"
+            }
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_SCHED_CONTROL => "SCHED_CONTROL",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_MMU_FAULT_QUEUED => "MMU_FAULT_QUEUED",
+            bindings::GMCAPI_COMMANDS_GMCAPI_CMD_INVALID => "INVALID",
+            _ => "UNKNOWN",
+        }
+    }
+}
+
+impl fmt::Display for GmcCommand {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{} (0x{:x})", self.name(), self.0)
+    }
+}
+
 /// Header for an unencrypted GMC API message in the GSP command queue.
 ///
 /// The fields before `gmc` match `GSP_MSG_QUEUE_ELEMENT` through its
-- 
2.55.0

