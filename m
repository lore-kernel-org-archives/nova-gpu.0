Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C937DEBB
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967226; cv=fail; b=oE/qk1qJjNuKGRDa5COC/aurO2lFI4JjmMTS7fg/5Unxug6plT2va/xWThPBkGEv/yEK9vZaBKvIT2ko7HYsJrFtbbaziCLdbGkXP6iBdjTDQwOYGtsPQ9RlqJP9YQczUyiaer/xYu1SuAuBNSUh7hdYuaAJUXitAV8itoVGK5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967226; c=relaxed/simple;
	bh=cb1BJP5hFXYyjNUy0wLD91cq88LIXOpAhchYphk88Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t1bw8naUH8Ufkssl1Ge1UcbbiUTdF/A+5lzfMZpNON5xj6a80ZgHWX9WH1aUp2/4oS+9KKSmwF0asbDlrO925Eid2dPOhqDzt4YzZ8LXWpsGxsnR9IBDUsPPRGJvUJwtt+uA+SJCmjUtbXBVzKByQTkDZsXO+ooxg5B2P6UaZJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hx1A7eC2; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hx1A7eC2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPMgTu+rxzr+PdTQNdNpKw0ilDNiDX/Tz2evmlZhe1Xop5CUrGIRPahgSAHWRZoOkoMoAAyV2Ql/fQiRKXBcrQPAN/+7BuUUcdTU0FNn6DHLevWslLwM4W/mxrIamhilSnA6WJdf7Be4BRoaQCSfEEgpVENclHH84bXKnclkZmt/TNDztzI3MHKc93PGVF9i+BluqdQNnBTCyJvXLSgONYbdqL3XQ9UTzzRt85DBHpP0wqlt/Wa4Pq1lEAso14pUTDNWxvrmIW6U47sMMZDlxohQNEY+sIWmYaUkAHVk8hk8ngXX7zjPMmETH+Tik7uhud2lR/nyqDsngBVyW/xH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOClEYn0U6XqlU0chrPSSjOr5hlhCqX8US9UPEIyJH8=;
 b=rXtW3AqiZYSxudpmbm3W8/eh32WFellEbLPmPavhyseqAjNN9yfz46QlQRovnodm0tgC8sYwIZHaCggPQQxKDE0GRpmGd+OhlDGBi/E59pkRV+34HjCvNDBJyLZqKlEo1keChH5mBlD194UGA2C224h6yoGwaPep87Fxo9oBWda7m10KBGD54ATzjgHSTxnhTPeiSVJeK1hNmSzs8yzErH+7yV+8oyZfA4PNr0eIGhFHKq5d+K437qfwl0zm28+kSxsHtf3Y06C0zOUux/5wcZZV/ulGpvgjrcq+WKx1RniG/+vhQsDBQ3AvCa0ivLiVATXx+tcioOzmthovN728og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOClEYn0U6XqlU0chrPSSjOr5hlhCqX8US9UPEIyJH8=;
 b=Hx1A7eC2pi8Nu8aUkB+xLw4uOuiGf82U1xwBNep6AdBB8eIEpSArn2wcvpJEJ3vfGZxmyPdMVBVvKA/q2FAFKmHTQDyy5adBPgpcdgwjYXd324E9w1w5SEUzJ6K8Qm8EL5S/zzZ1SI7oLqSbUG++t4tI6H6Xm1rW9knj08PlmQS9GekJqw8EGlDhMb2kq4+TWUq7ZRxBQfIegjew5pUbWOii/qlJcOobDQrC5l5RlUSNhDPlM1CYFecLZD2f6Jku8gYrCZ+ZKdqhKVNnaE9mf9Xyz48WKp7Na6wsjKJ678NigJirTIcWFv8lluXc+gwn4lpY1sbMYeKAmbPU6knBnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:33:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:33:36 +0000
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
Subject: [PATCH v2 10/15] gpu: nova-core: recover the GSP receive path from corrupt framing
Date: Fri, 28 Aug 2026 18:33:29 -0700
Message-ID: <20260829013324.499542-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: a460b8c4-096e-4459-9981-08df056d8b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZaaycB+6v2Mo2wwIJiDN8IZhvODOqfV0e2m9/TH8J8RM1I5PZIAjk5KLJdxMnQQbozsazdR1hl7azNl2WY5jl57gF2iRZy3oowCxldPRkdWsr5Gi0RoIQ0A/rufSQNdmnEnFjVPJSmaqhtjSNjieuZj0m1tNh2WlcCxZoxO1mpwy6p9PMIB/FASViDn3p16LfXSqcKPXDUy7dhL9liFaHCgGLEOV6U/rqHe0FGjUVAKnYqzImvhemzi0SCNWFeq0vKt4RM4GmlZ15CqgU+8BXMzeCTWhd1X9awh3xnU5YHjZjxYdIqLDItxwzi1uylozfp2KDINFFLlva5KxcDBAaopKugL7+hvVhIUXuXbsIQANRScvSEG167dSa/rlX5eEf2oGUT8neLOKc4gqOu1IXykDRwLKeo9/XueM/lF2cNO2w4ieCNkOO79csYfbibPWVfYyo/HPSxd1f/1qJvYxkjzjpz4ygMyo24lBVPkc20J479sgABITLZP3aY574z5JSrcHWB1UGs4WMXkb4Kuiu+GpwYbjpQ+Fffapwp2sjhOuElQu4/osj350fccdX2A/QbOVCfnFgPHBT8a/SSkjs/pFRMLtJ2clSACmHqDAIJxPZSRTWMZprlmORDeBzQkMvVjnk+n1iSVlFySRVvqlOBRWLY+eUO0Kml9oooPnTpk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dMwhSrC7HO5h4OPceqR0iyHnajEuikHsz6gCQ5bsmHnrtCvsHUZsLjwGkWhG?=
 =?us-ascii?Q?GudRTIk0yDFSynjk4U7ubOT/bEF/zN0v55G4CgKwp54nvlVAJIiPLc+9EVl1?=
 =?us-ascii?Q?PycGz3Hosg5UuzzOKadexftLKU6w2QCC1UhtEQap0DOXvQlsF/a3+qrCRGGH?=
 =?us-ascii?Q?ArbFxVFFzJPajh8lfXjbHJZRF4eUyPPBEyg5UAD+oPjJ5wZqhlsp9tORLfhd?=
 =?us-ascii?Q?N4dcS4aMxMObHWlaEzNqlrYYtktVEowMpXDVofs65DMwFYz7Vo7x2XgemGlw?=
 =?us-ascii?Q?iNZMzucSlZjGKMuWxl5ATgwRfL4jK62DL3PAReaCCWwA4qYb7yGCaNYxVWQW?=
 =?us-ascii?Q?xuDLOExdjsDaVc2nZBKq+/MtU7AWqB66KLgu9FZRlxBmGn63SlrMSDRFUjAk?=
 =?us-ascii?Q?+Gxh8LPFjPsfqA/TTvZ+S+Jftp3O4Bv4Vp0ZCiROKyaewkBXWkDTNKyOHIhu?=
 =?us-ascii?Q?CD6utpoYQtD9dx0NBRDW+Nix6+QljcFN5rinyYAQvmEX74kbYMsVkXnzTE6s?=
 =?us-ascii?Q?ZCT1xuvuwLRRMO2vIdb+Civ1BLsojnbsZvRGFSAIaTPYNKISnVp1qdBw8Hd1?=
 =?us-ascii?Q?JCYLOy7k5dJQkVX0lVIxys0afND4WdMUT8XxgwwZHmeeT++GZW91BXS10pmQ?=
 =?us-ascii?Q?0pSoOnqz0iVFjBGvZmQsxF7EUOHKIcCcGHUaZbUgtHwBN3zpAcj6im9cD4bM?=
 =?us-ascii?Q?XYkpknl+5aR48J0u98AD/zQH1pFzzyna4ui6IYjfWI+nzulhOy9cLHJ1bTTl?=
 =?us-ascii?Q?s3vN4qkGAO/Zw1ctpSoXIPp5nqla4k4PhXD9Py+vbEttfsDlO5Q5Tw251V7a?=
 =?us-ascii?Q?E9Yme0sSYt6cf9d7jvKAOipXn5dJtyO9YSRPOsFxrA7oktPkZHwjmzDWgqU1?=
 =?us-ascii?Q?P14gYKgKq3qjRSkL3YP+ebD80gkcV146qDEk3bkcUuLznGZVZhG1jWoYOvjV?=
 =?us-ascii?Q?ghGL9dUZWFDGO3SWoaWvPhvrtEDCmYZfd6RfGRUZw2BNpUY345FWCYBTEwKR?=
 =?us-ascii?Q?zWAdzY3r1y5a+K3EPJxcgppr4Imd9RZIirDgc2Spud8lYuKSv25UtX3WvdIm?=
 =?us-ascii?Q?tKPRZmLjFHWVjDvW02jJBODEuWa8HU3NrdH+bR1pE2lWXVUSxbNsTH9kBDp4?=
 =?us-ascii?Q?S/dZFzZuGwWuSSUw/LJR+NR3GHQLiCgkjrTbf3rn47HZE87vGBdsdZi9RnJk?=
 =?us-ascii?Q?0DhKSDQdZYWbCmO9modbEvFXGmvemhfT39/3V3boD4esfT/QcSZzC92eI47e?=
 =?us-ascii?Q?LRiP7Y5p88bUdFdc+EJlwoZx//758EMAWT91020I9k9yjCv+ZHaeC29zdRm0?=
 =?us-ascii?Q?zXO39DIT7aNgx47/GmDb8Yx+V4HW2E/TTixohUVichujEz/99unTuyZCG7xC?=
 =?us-ascii?Q?fh2JvLhmL3h8FXlctG/kOJypPQHE5ESyQlIl+LCykTS9LQtVAGHcqZa9jSjp?=
 =?us-ascii?Q?07RxKGHX1DNdlbBH/7scxWVC+MowZ1yKK5KhCsBoZhTnzJQ52wZrhGYRU1rV?=
 =?us-ascii?Q?ba48sgu9QvD5xxfLg4fL/wSW5XwLdE6VGHJ50ar7sxL0/4A4r51E7/tWj3DF?=
 =?us-ascii?Q?DPWeUGd8c5Ns4jNiWhqIRD4nh2QVpFiw8fpEinQKsQy5nCIegd693jeokLny?=
 =?us-ascii?Q?Vo12z7B8/hpJAecQ90P50UYvvjLKbW+aV1O24jy6jPt9UswLTN87MrzNJSTT?=
 =?us-ascii?Q?BxPr6Vqk0joFv+oLdsR1c2QUbRwpzsUrYk5NRGEhF8alUlkKoXruhrZPsztN?=
 =?us-ascii?Q?3o5jZ1/kow=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a460b8c4-096e-4459-9981-08df056d8b85
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:33:36.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVmGOLG3apST3hYhl6wV0hWVWV0OkgBNSHdvy9JHxYdse8uMQ+qCkIG6iCH5WwCvI1w4IXGDSrsuuRapToZprg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

A GSP message carries its length inside the checksummed region, so once
the framing or the checksum fails, the length cannot be trusted to skip
the message.

Two paths left a bad message at the queue head. A framing or checksum
failure returned without advancing the read pointer, so every later
receive re-parsed the same message. A validly framed message whose typed
payload failed to decode returned early and did the same.

Poison the queue on a framing or checksum failure, and fail every later
receive, so the bad head is parsed once and recovery requires a reset.
Advance the read pointer past a validly framed message whether or not
its payload decodes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 63 ++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3224079abf7e..fc4c229b8b9a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -3,6 +3,7 @@
 mod continuation;
 
 use core::{
+    cell::Cell,
     mem,
     sync::atomic::{
         fence,
@@ -523,6 +524,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Err
                     gsp_mem,
                     elem_seq: 0,
                     rpc_seq: 0,
+                    poisoned: Cell::new(false),
                 }),
             }))
         })
@@ -622,6 +624,12 @@ struct CmdqInner {
     /// [`CmdqInner::receive_msg`] match that reply to the awaiting command. Advances once per
     /// logical command.
     rpc_seq: u32,
+    /// Set once a message with corrupt framing or a bad checksum is seen. Such a message has an
+    /// untrusted length, so the queue cannot be advanced past it, and every later receive fails
+    /// until the queue is torn down and reset.
+    ///
+    /// A [`Cell`], so the shared-borrow read path [`Self::wait_for_msg`] can set it.
+    poisoned: Cell<bool>,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem,
 }
@@ -748,11 +756,13 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result<u32>
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
-    ///   message queue.
-    ///
-    /// Error codes returned by the message constructor are propagated as-is.
+    /// - `EIO` if the framing or the checksum is invalid, or the queue was already poisoned by an
+    ///   earlier such failure. Either failure poisons the queue, so recovery requires a reset.
     fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
+        if self.poisoned.get() {
+            return Err(EIO);
+        }
+
         // Wait for a message to arrive from the GSP.
         let (slice_1, slice_2) = read_poll_timeout(
             || Ok(self.gsp_mem.driver_read_area()),
@@ -763,7 +773,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flattened()))?;
 
         // Extract the `GspMsgElement`.
-        let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
+        let Some((header, slice_1)) = GspMsgElement::from_bytes_prefix(slice_1) else {
+            self.poisoned.set(true);
+            return Err(EIO);
+        };
 
         dev_dbg!(
             &self.dev,
@@ -777,6 +790,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
         // Check that the driver read area is large enough for the message.
         if slice_1.len() + slice_2.len() < payload_length {
+            self.poisoned.set(true);
             return Err(EIO);
         }
 
@@ -805,6 +819,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
                 "GSP RPC: receive: Call {} - bad checksum\n",
                 header.sequence()
             );
+            self.poisoned.set(true);
             return Err(EIO);
         }
 
@@ -830,8 +845,8 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
-    ///   message queue.
+    /// - `EIO` if the queue is poisoned or the message fails framing or checksum validation (see
+    ///   [`Self::wait_for_msg`]), or if the matched message is too short for `M::Message`.
     /// - `ERANGE` if the message was not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
@@ -850,22 +865,26 @@ fn receive_msg<M: MessageFromGsp>(
         let func_matches = matches!(function, Ok(f) if f == M::FUNCTION);
         let matched = func_matches && expected_seq.is_none_or(|expected| seq == expected);
 
-        // Every path must advance the read pointer past this message.
+        // Every path must advance the read pointer past this message, including a failed decode.
         let result = if matched {
-            let (cmd, contents_1) = M::Message::from_bytes_prefix(message.contents.0).ok_or(EIO)?;
-            let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
-
-            M::read(cmd, &mut sbuffer)
-                .map_err(|e| e.into())
-                .inspect(|_| {
-                    if !sbuffer.is_empty() {
-                        dev_warn!(
-                            &self.dev,
-                            "GSP message {:?} has unprocessed data\n",
-                            M::FUNCTION
-                        );
-                    }
-                })
+            match M::Message::from_bytes_prefix(message.contents.0) {
+                Some((cmd, contents_1)) => {
+                    let mut sbuffer = SBufferIter::new_reader([contents_1, message.contents.1]);
+
+                    M::read(cmd, &mut sbuffer)
+                        .map_err(|e| e.into())
+                        .inspect(|_| {
+                            if !sbuffer.is_empty() {
+                                dev_warn!(
+                                    &self.dev,
+                                    "GSP message {:?} has unprocessed data\n",
+                                    M::FUNCTION
+                                );
+                            }
+                        })
+                }
+                None => Err(EIO),
+            }
         } else {
             Err(ERANGE)
         };
-- 
2.55.0

