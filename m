Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9DA30ACF1
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363773; cv=fail; b=SL6Ci51aA84HM8kOAxD3RZy85NDhNcCCXpITq17uaMKZm5fPszbu7WGWNmzSf53naZi173f1Mrpswz9ZiRVwBolEnPg1PJXpnNadFW4981JivJRFLH3z6JzKvZZZ01LhWUT+Ijqavf29nEBPG1kOldHncu/EWnN9t1iDM97F+Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363773; c=relaxed/simple;
	bh=loKwwk5qi7QdM1VJCAPo2Gb3PfPUSNE27tP+D7FCChM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ad+uLrvQJDUG9sBUkMTo7hwqgN3e0z8nYRKJwR6hIOh/DZZq/g4BMNC/BBgO64DkvWjeTDb4EQv2V6P9S/QsydpmCdphpxN8hpk2OYCVN6WoAaKHPyeh2pH6UOWZnEjtfxVJz6WQwmiEiKc0A1S0pErjKvYoJ/8oNf3ar605eEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A4d9fO3w; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A4d9fO3w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/0k0SvN9beBUE9KJzP3QYddGnlgyTD/P3uCIziILKaBJTY/oeHlrxYXUz1X3f0oueD32L5acLmMTo9iPGYtaTnoopjVuP8KI0R3B2FgoxyE3lTfWFAIST7N4s7KfyCmmHKvyTGWmasED6gGpTBC/4maeJg+m5LQNdJOANRVsINyHRXH+sWXrbbZ4w73WOmKzjw+junf5VCpKWMmlaLyRxnczKlxE4icEinExMWdr3zINKVw045JJ//V7yDD8HGgpOrBI2qMoAr69TLJVcribmOlJpLarLaELTDRbKGel4VxSxXNCmXVIon25WXJ7pCRQ3A6AuyAyFkJjzF2cXKbWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REYZEN9bI25aOwZaJ/CSzRa6soylVIB4wnxWnC9OzpE=;
 b=Wpb43rAzMsFsUQs2swNA7is7tbs1VM3irfi+5FkNItd6s2nz/jPa0d8hUasdqqhN4VXCFz+amFnNLe2zQg/VguDetNp0thw0TDvRq6HMjASKWRnNI0XwugVosQoKrAPI1QQVfPpXHpkUcJBPLptIsWVy+VaGfXezlRRrTDY9H+wyWisyNcS38wOyLz2dirq6QBu7VoN8KV6nmCy9tbRn6Avr9/4cp2GhhA9kwL3PeAuuukDCfBLzQ2oqDZsdq9Xz6c0EvFzvdii/zXgFqfLqIEKUyBCx22ahhlSuTgaNCCYLhEO4OCiZesfYiYft21OKj2xwGhDDNQmNGxuOYi9DEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REYZEN9bI25aOwZaJ/CSzRa6soylVIB4wnxWnC9OzpE=;
 b=A4d9fO3w+NqDGz27UzpUivFa3/e2s3zgqZ1A+yretvBh0siRtqssVmJClrup6iqlfKc+zW7aIw6zo0NC8dghy0rYF3+9CcYlb78LPiIVq3/Xc4hp7w9sICtbNc57WGPZUByy5vkxsjXB568tM4c6mCpbS54qBlgXRqJztByXSHL40n17xrdt4YAkD6wTJjTxYoIOQ1I7SjemoDEmjnPL6SY+01BZxLs/TjYnl3NGUBgV49dBRVzhzhKY6idDLrSBr83PBPyM83OyQSnpFQSUX4Y11xQY2I43DglcCqgQe36mOd5cHX1td+v9gQmxkiK82r/gylVsqpOzfDPuJngL1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:56:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:56:02 +0000
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
Subject: [PATCH v2 22/31] gpu: nova-core: gsp: add the GMC boot event dispatcher
Date: Fri, 21 Aug 2026 18:54:39 -0700
Message-ID: <20260822015448.238214-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5d6d9b-4ff8-47f9-98c5-08defff084f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+5n7XDcZgZGy93+kmtEjkbz4dSLM1O0Dr24u/ROgPQblVRMRrcR5IcV00dbaXhPc5zlOg48aHaK6JcJxYPIh2fTCv38HFKMkYuvUnAgeim0YB+0m2IxJD2CxL8PMQze941o4t9GSnoO6oUGjHQcNlVkTKM+soYhOdynQbjIT0HMAmsadPkcs5BIlGU1Esd1/6nynAJkl7DzcR1G24+ZVkKyjjgsS/M3UvX93xTf20b25kN1dQELfkVVDMjuK7stGWi5Gy3Z6umszgdQm8WTLfDyHujnIS09+Z9YOwHbbwUoXuCijxKdCqJhQCnzFmT/TwXu9BBSE0XUrNgQXr6+eAFlzsE4GuQpNYQMgWwAx79pSFIKWXdSjWEm8+kQlLUUfjLoQwd+cAYbjklsGw+P+Dr6veQqQ0hqVU3v+J0Q7JL1ZsaMgnH/t4BNXy51UZgv0Od+3mr+BWydMcPBBIk3BqrrJNii5XWWc2hMO7/WboSo8cXF+EbFAaseAmVCgSeq0xKR8Q6iwpj16ZrggrCGgIN3ujgzlem0vSWZrpg0BIHsAdtETGOT7oko37F77cYzHFhoZJPtHcEMHSKW/Q5NKY1zgX8AeaQ88ykEVSeON0B2M1Jdo7VDoY7XcsJf9pcaLULiotWzjyIMyg9tVERxKnWhHjBLsDSl71DV7mV9OfVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IrGTshZYH5ZlFo7G0pYkuZm1Z7mkJOWS5zaMs/GztxmXr3SKkNhFZCR9TKAm?=
 =?us-ascii?Q?7lGdRGFjBb9S3PQxiw5T8pkJUfOUSpp6GliDWqU051l/HpbaNJgGdQCanr/P?=
 =?us-ascii?Q?v78xSZS2vQ+YbihAAM1zSIXwSodjAMvf6x+WIiI8bBjgt77Fmt+W5bB55qKr?=
 =?us-ascii?Q?WMkHxf+oSknACJ8NfTDmkzd9ZDWZH2Wijcbpajwpi9wYMFYLfGikxk8pTMc9?=
 =?us-ascii?Q?9hdXfZmfsPpHIpORmECuVPisDSM+YIy5+XFlVK6108R6NZq3pemZI1ih325t?=
 =?us-ascii?Q?9qJ/cCdGQ5Ur1NuiOiY1Me4Vdc6EIDv6nffCFtYGcYCpCOGYb3J9wcSGCR2G?=
 =?us-ascii?Q?2rCJjSbuO7xiz2yMPhObTg1aaaKd/lqCgzjW0gX1oE+wpgG95K26khV5XGwo?=
 =?us-ascii?Q?xqTlCmckYVsUmAZ697usBnEFRDt7mIRuAgMGAGCtFPQj5BQyktvLMedKV+Ll?=
 =?us-ascii?Q?cnjY0o0efmYF8eUp82s2c7BmRNWWowAJx1jOdzxytpt8kA2AOwv+zpUAEOhC?=
 =?us-ascii?Q?dPmJXwqQzdXD3I2AGDUXcLIQjxRRWnbE5OlBkILSWoi3DLE8VhE7jLMNGY4t?=
 =?us-ascii?Q?L8zOSsuQ9XbSg+wNOpUKD+98D2i8Qhy26xX44nV27OJafcC0j6bFtoMulw4S?=
 =?us-ascii?Q?5MwhmUeBTTmdT+o67wizE1bg5GblVz3XEDHc4YsJbgOoBaKQO/ETGwL0PXwP?=
 =?us-ascii?Q?vBTatQ5DQL+50UYvXkY5PJX7cv37vXiTgSe4YAwHhpEsi7abdGGg2jhyNwUs?=
 =?us-ascii?Q?yV/x7ESNLVJgfVBMrOqUgqxiUmEqfMP9ik7RpDPhjbPf0pkDyKtG1ThMAOiO?=
 =?us-ascii?Q?AisiKRjYhWd/P7ffL+bAELrdElEqZ+rDUSKLUM5Uv8EkEaPjCTVajb2L1LmD?=
 =?us-ascii?Q?Ffx60v/+hqd/m8Pp4pmJtqtEcLrfQeODscIsxfv73CeyZf6XL73wGtKURm1Y?=
 =?us-ascii?Q?TxcA1YwBcRQ9ChdTWm4AtCqUBBfeGCI4bsz9jvQgur1ypHGnJZM9qsdndDlT?=
 =?us-ascii?Q?aEnco72JsqPHMWhkphbTW+YzTWMxUpXkDTKcCaVi+e0hU8emH+JiAIOZxp/n?=
 =?us-ascii?Q?vwlICKxcanJQ9r/AJ9tzguli/CRfFDj2bc65Vpsn7kMJf9d47stMfKXanJ73?=
 =?us-ascii?Q?GyYQX7vEVPx84/Rc6vIHvZm1sa/GmxH2SCM38SMCN9bCebO/ea/lRVw5z1NI?=
 =?us-ascii?Q?CsQuriRKCdQOCNGMk21Gc43uUchYlVje78WqZ+oYo6x4t0luY1xOsk2CVc42?=
 =?us-ascii?Q?2mnBBOH4LAQaO7ASyN8Z66Pz2NVCeSob+cSCK12+bJJLU3MAIbaWoIZcWewN?=
 =?us-ascii?Q?kzEfFIxLzYXFptZ7rYvQRfP6LW56kCH4vvxFBN6IQw6olBPCJTXJ+zaLiO9m?=
 =?us-ascii?Q?67v0jj5lXNz2hgRImzBrsseNv0IggLnjoopU/rNq3YKnkFSXYtnCnEma9w8M?=
 =?us-ascii?Q?ViliKJASne2ZSTS1ubFwiZs5qkYyUrq4UPN7Hb6UMMXk9sl5tTE8iPFPx3jS?=
 =?us-ascii?Q?464k70J5vx0wlVbeHSDBO8kJWCoS9RqUV7RBvBFYp8h8WHE1RqY4NZuC9ACB?=
 =?us-ascii?Q?0o5HzDP+gWRjEVdTrspue1SA44LYOs+N3aixSsC98S9JkAdkbaSegfo/Ebjm?=
 =?us-ascii?Q?LCoujZe+ERdad6cR2bPTxI4onkvo3Uaig2mVjruRkEmnxnVlzQKXEiWkuMi/?=
 =?us-ascii?Q?hIr83jWt88wfWzrqYIgjkUsxioY6u1szpY3BaMULELLttPGy/vB1Q46xaBIV?=
 =?us-ascii?Q?JL0PM2yqhQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5d6d9b-4ff8-47f9-98c5-08defff084f6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:56:02.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrnEHO516FDXmgVIXSu2w4Mw11j7FbSvAVKeUqIgqBpel2KwhNJpjo8anietSJTDF6poeAtxLalVFi37NP4YMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

The r000 GSP boot protocol sends its two load-and-execute events as GMC
commands, each identified by a command id.

Nova-core has a handler for each of the two events, but nothing that
reads a command id and selects between them.

Add the dispatcher, keyed on the two command ids from the r000 bindings.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 62 +++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs   | 10 +++++
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index b7079970e049..9afc95e534a3 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -37,7 +37,11 @@
     },
     gsp::{
         cmdq::Cmdq,
-        commands, //
+        commands,
+        fw::{
+            GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER,
+            GMCAPI_CMD_EXEC_HS_BINARY, //
+        }, //
     },
     regs, //
 };
@@ -163,6 +167,60 @@ fn core_resume(
         Ok(())
     }
 
+    /// Dispatch one GMC boot event to its load-and-execute handler.
+    ///
+    /// LIBOS2 chipsets send `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER` and LIBOS3 chipsets send
+    /// `GMCAPI_CMD_EXEC_HS_BINARY`, so a given GPU only ever reaches one of the two handlers.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `command_id` is not a load-and-execute command.
+    ///
+    /// Errors from the handlers are propagated as-is.
+    #[expect(dead_code)]
+    #[expect(clippy::too_many_arguments)]
+    fn dispatch_gmc_boot_event(
+        command_id: u32,
+        payload: &[u8],
+        bootloader: &GenericBootloader,
+        gsp_falcon: &Falcon<'_, Gsp>,
+        sec2_falcon: &Falcon<'_, Sec2>,
+        bar: Bar0<'_>,
+        dev: &device::Device,
+        bootloader_app_version: u32,
+        libos_dma_handle: u64,
+    ) -> Result {
+        match command_id {
+            GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER => Self::handle_load_exec_bootloader(
+                payload,
+                bootloader,
+                gsp_falcon,
+                sec2_falcon,
+                bar,
+                dev,
+                bootloader_app_version,
+                libos_dma_handle,
+            ),
+            GMCAPI_CMD_EXEC_HS_BINARY => Self::handle_load_exec_hs_binary(
+                payload,
+                gsp_falcon,
+                sec2_falcon,
+                bar,
+                dev,
+                bootloader_app_version,
+                libos_dma_handle,
+            ),
+            _ => {
+                dev_err!(
+                    dev,
+                    "Unexpected GMC boot event: command_id={:#010x}\n",
+                    command_id
+                );
+                Err(EINVAL)
+            }
+        }
+    }
+
     /// Handle a `GSP_LOAD_EXEC_GENERIC_BOOTLOADER` event.
     ///
     /// The driver does not copy the image the GSP asks for. It writes the descriptor the event
@@ -177,7 +235,6 @@ fn core_resume(
     ///   size this driver mirrors, or the event names a context DMA slot or an aperture that does
     ///   not exist.
     /// - `ETIMEDOUT` if the GSP does not suspend, or the image does not halt, in time.
-    #[expect(dead_code)]
     #[expect(clippy::too_many_arguments)]
     fn handle_load_exec_bootloader(
         payload: &[u8],
@@ -269,7 +326,6 @@ fn handle_load_exec_bootloader(
     /// - `EINVAL` if the payload is shorter than the parameter block, or the ucode id does not
     ///   fit the BROM register field.
     /// - `ETIMEDOUT` if the GSP does not suspend, or the binary does not halt, in time.
-    #[expect(dead_code)]
     fn handle_load_exec_hs_binary(
         payload: &[u8],
         gsp_falcon: &Falcon<'_, Gsp>,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 31c0e6351fdc..89482d2648f5 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1012,6 +1012,16 @@ pub(crate) struct GmcApiHeader {
 /// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte carries flags.
 const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
 
+/// GMC command asking the driver to run the generic falcon bootloader against a descriptor the
+/// GSP supplies.
+pub(crate) const GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 =
+    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER;
+
+/// GMC command asking the driver to run a high-security binary the GSP has placed in the
+/// framebuffer.
+pub(crate) const GMCAPI_CMD_EXEC_HS_BINARY: u32 =
+    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY;
+
 static_assert!(size_of::<GmcApiHeader>() == size_of::<r000_00::GMCAPI_HEADER>());
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, command)
-- 
2.55.0

