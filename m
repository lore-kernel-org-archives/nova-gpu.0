Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279D2F3C07
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363734; cv=fail; b=KVkeYjp16gbCrtqfPfzOptn7HTyUkenkDF+cQJvqzZXObsXFRK7trOZZy+Vs5rO62hTb63vY3cajTPp4kse/sz+T0geH8lhJYHXOzw/jhDpRUxD10fpWqZnxxzrciJoyhgRt2LZYTXZGFG2QeLDVHAEjnq5hcYW7kGk3JWx4/4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363734; c=relaxed/simple;
	bh=9+/BlJQDNVlqFhLJeNrzfG5wcJA/C02kLTU3SzPTR84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=luQR2Qs8oWRgtpdeQLJgxfB94O8YQpv2AYGNYBaA7L6UFx6z3FvenTULhj5d3ikLdIkPCErtkKWWyyG9Kf0k0zTTKlcZlUshgvCdMKKxrkGTX61xRQxoLOMBJ9bnT0tl7nhL+OqIieXX4Q1+LldbkIXxiiteTQrJ4F/wyUq6Fpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HNymxZ6h; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HNymxZ6h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCnswdkJgObU43vIZJz4etvcJh6bGaiqEU2qyk7Emxunku/DuC4YebCPojiU313yI0J3HwPsnek2KHC9mlNZxB5eydWokd9+TQifz0MPQIp9ij0kXgHhwGChIIVKIpfvHbid9r7+wehxzqgJaYgvcxBzUdryP01s9YfwjBzARcEIazD+FBXgJZcJI2mh9gtgXH4N7wMyd3uG3fJ+/KJwwWEDzrqTLf5F1RGZ+yKt948sLi8b22loLbz3M5BNRxXHhfyaUFI3SSRAdTaqXsaqoCjyWgtFGtHfwZqqF3acdLi9WnWgYWtgB4EUmxp/jnc0Upw0BRM8ph+wOabihvKKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymd+pI87L1/pxY7U7JmRVpsvJ4t3BMxNxnuw77jqt9g=;
 b=cokPD1p63F+7QdVKXcWMvPiKV24rEXhjjem6QVvh8cFVUcRLNTVtJCmE4RW4nb9Xp7ihsLpAoapSstxzN+SNGdnGtY7CXSlaBoOQ4pnJnWlAHfUDPrHYrRrn8V9Qztm8fODwIGNQ2OYDQBaPVtOYLHmtrq1Kfnzk8iEd0Oe9MQHnqW1cer6rvsCOGbl7aLS+RaVQZn8N3bJU40H5DuDtPTBe2bRYQ/eDXfzsGkhfRzQFTBwtnwWhyveQDFH3dp8TSlQN5VSlDbOa4z/gJuHt/3JwRahocziK3aiNlwQsGKqF90hz6dBNHhi38TsFWS58i8wmMQcWm274jk1HMatyfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymd+pI87L1/pxY7U7JmRVpsvJ4t3BMxNxnuw77jqt9g=;
 b=HNymxZ6hSY7sS7FA15HoC3vr5FDOFM6Yvm8nI85TNvR6hEbefelr9i+EXtHcawMjThYu2yEI155KdqGZBjW9IXtQUj/ol7y4GdsXKTR17sWRnIfJsDn0s7B0vtMwXJuzJzf/2+lAPN7Qt13x1qk7ZR1EMCN9BooYQG7YPXVeRS5jjPHXFpmE3xm3us5+JuXopXmaEmTcvUIY51kqphvZHB+9LB1IlAE+K45v63oXGpA3MgeIx/82ZX6Ex+R2JVQ0ycWRHYqmriQ6C6ri1/gdzVZSr3OO5fqkCso/NLc5UDFGj65CLmx1MxaB/d8NhjEx43sEOPQEmKYXbd+YN5YGAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:23 +0000
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
Subject: [PATCH v2 09/31] gpu: nova-core: add LIBOS3 log buffers and state monitor buffer
Date: Fri, 21 Aug 2026 18:54:26 -0700
Message-ID: <20260822015448.238214-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: ad35950e-71b6-4e93-08ec-08defff06dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|6133799003|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5rAdQE9oKTMw7pcvGWUzc8gbHURHm5Dd+OhcY8anMktno9ZY6VDqzlCWmjsHZM6uD8+O0GquwmsRUjlDfzSLFnyz7PXdMlPGoes71XhjBvC9nnaoIgmjPTe2+LQlRxa69u89PJ/M0l+3a0nphwGArHXE7UOHmzLj7gUGQB62gruBp76x3jnTCiB1rKGjedUJW3wbk0txq794CS6Cgdxsha0ZKYP6P/THCBB/ngoLNx9/3mFgODjL/bDE6b7KqcBFw7i6HBMnRLeMHKLMcz1mIhIbrxFN9lppSIQ3ptHyrl7vWJZUbpYDhTSI7GQwt4upvvO1WyUzBw3gIJgQtBNLanUJTkqYjr9d+pgN8omFyCACAiXzPBbFwa5aBAZyJkvry+ghHz7/C6VK+CnSoowon0ZCuuSD+Vi6GYzci1o1K2DuMEn3u4CacCcRv9adKUygR0n7zvYjbUU7bi2TE0VDtY5mUCk1eQKEINZxL6VMgARPcUYM4G4DZg1Okmxj4TnVNkQcip6hdtkuybnxmciApbqlKaRxtsFxYtgsC2qslWB4q9HXz9rPB8omJTtVKNJ/YEZKCxltSElxEi01uP1ignggKALsQJ7nRwORIt56U3SBa8AJfTAfeUwdaV2feHfMXtKHNICXnHKRp41ae3+IzjdSFouxRz3g9xlLRIa+fVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BVuWq5s7Iygbvrq6T9JwSQnK+lCTen6EGW7IRpofGtjNrFCEBn6DO1ajD3cE?=
 =?us-ascii?Q?2th+pF+06FZmu3/YRh9uNzIIXG6THrLGVzRhI4yVFhlNvbixm8FPk1HyE+8Z?=
 =?us-ascii?Q?G4zzFGfVbVq/lhKOv8VAXqVc96EHBsu0LWUMmM2SdgHeOOy8REnWTgp0ifcN?=
 =?us-ascii?Q?I4PVHEESGz5F/CSBPK9zoXXIHfTtwCFZmnVcVVpYZAMvtLLt27iH4CKVb9AH?=
 =?us-ascii?Q?jSPbof7EPKM/tXnvDxPctqhTntwXgV68esyJO4FCFjyZwW3Vkk+PbYnFYMBi?=
 =?us-ascii?Q?ULnCytuLhUSUZIbo/4OhnQS4AIN3D9q/LZ2CgLV6SaB5uUh7Zyxbyoxw2WFl?=
 =?us-ascii?Q?7Hi6fTJ8CkuU2FatTQZL+YojWbInCWZu0csB9fIhmBplIDBTqffeiuiqH1V2?=
 =?us-ascii?Q?bCbzJy0eOA4HqwU+x1siNdLEBtWVLLNBuqkUdOmHpz9fQ72+6ErVM+mfcm4O?=
 =?us-ascii?Q?mLtsjD2yaZjlIl4eUwuVQjf9BorcFTpjzBD9HT6Udz5AKu6fffLhLfAafSOd?=
 =?us-ascii?Q?4cxIceXtL7l9Tu2yvIwajH2c9xX9Eln0Qc6QLwQqrSGZt0o5Dlq383XeiRJV?=
 =?us-ascii?Q?j6f8ijC2YPT+loPKvEo1YLs6sIqj4tpusqID798L4zEdfsyx0avO/6tyXAlB?=
 =?us-ascii?Q?9KhYWxcXhAR2HtEm5NbrT/OOHOheM5P41pO9xG+7UK+5EB/+ZDWMw6Nfbx8s?=
 =?us-ascii?Q?uAYxyY4GsKrgTNUcUfmbJh/+N7E+3y2yM1ZK9jWTIh1YolIrnAxw6+rYfCo+?=
 =?us-ascii?Q?cbGzPnSiiucFvcmETXnG2VdQszkAqTCQ7TT09/jxbw83MVeYFEXOrKK8Ugts?=
 =?us-ascii?Q?3n8tDxv4sJikqYD8imfLbbUEwWnG+UZOD42+Jb+C7V8g4KNCUO3qE7xE3BGX?=
 =?us-ascii?Q?eJXaMkwBC8phGLbWhR/MqWAXaaXvUdmq3DuKYAkT7PqFDXL13MLZT9m5AC1y?=
 =?us-ascii?Q?v8nuoL1d+uHrbUqMmblNCeXsg5s0J3U1kWkxyBV+VCPVbLRxlg04by+NHMOd?=
 =?us-ascii?Q?z4sgVFZrRIaxrBRRdzZFOv0XrJTBpJ/ORvPp4HujrUf9n93M+Gyz/Yl2bZKn?=
 =?us-ascii?Q?6ihv7zDmzcUCLDZf6xsKL4SzZtlWcXpU71LDeLf7sSwex+PVO0/neYnACET1?=
 =?us-ascii?Q?T6rSWPY4cUEfqVWq5xzgyFFncwqzNwr8kuR4ilEuuHhaOb4tU6TfGJQ2xPXX?=
 =?us-ascii?Q?Hf5aMk8C0nhqO938iy1Nw5NZf0Xiagjy+9lNU4dXQkhfdiNQ6RW/JTKWwPbW?=
 =?us-ascii?Q?WIoZ6spTljx2JpQOa9vQ1r1Gpqf/4pjfju6O90V66krfCNIxRVn/OMhvx8Q2?=
 =?us-ascii?Q?i0iOyZVadj3/lrzmCO1g+EXS4yNPDhOvFIab73cqIYvpXHjjg/gYAakaLd2v?=
 =?us-ascii?Q?sO7P8u+eDgsPhRu5PM/DaRwAjxZRSu3XJH0GaIJuuxGQYuiPdRuECDmqUrc/?=
 =?us-ascii?Q?uVfx9g9dQn3TPnMJ8L+59ahHUOMB6YSFg0fuQPoat5x4KtT7XO+603iaWELb?=
 =?us-ascii?Q?ku6Yw17DGthGsJRECk3N0EB0Eb79oAmvAObyE/aQ6ejo29RaNyt30ndUE5D7?=
 =?us-ascii?Q?Kl9dYyclHUDsvHCYkkUcYROrPlwc6ZDBd/d9JvCGmv0hpp6d5j9zSLDSpy3J?=
 =?us-ascii?Q?aQEoIoFvQ7q3g1uOG4HwmH+VsuurwXVHbCNfLRfiAf7RamkugXbQGVGu3Zjz?=
 =?us-ascii?Q?1R4WVdhw5gmjy9hCPwSJbK9Su8EwCabtFrgzHrHeZelDj9bOaw7prQyr2CfA?=
 =?us-ascii?Q?yA1PzbKY+Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad35950e-71b6-4e93-08ec-08defff06dec
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:23.6157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TErCImSS/DrSReTTousVqUr59h3sVxL4txOAYuNI182Dc7yuwYperxtEMShRK0CI1fRmR7bXXcpswbX3ATzzBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

GSP-RM on the new firmware logs from six LIBOS3 tasks on GA102 and
later, where r570 logs from three, and it maps a small buffer during
init to report RM state for diagnostics. Turing and GA100 run LIBOS2,
where only the init and RM task logs exist. Two of the six task logs are
a single page, where the rest are 64KB.

Allocate the three missing log buffers and the state monitor buffer,
give the log buffer type a const page count so the single-page buffers
can exist, and expose the new log buffers through the debugfs directory
that already carries the others.

Nothing passes these to GSP-RM yet. The libos init arguments gain them
when the driver switches to the new firmware.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 66 ++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f9a622edf299..de5cf3914949 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -82,7 +82,6 @@ pub(crate) fn dev(&self) -> &'gpu device::Device<device::Bound> {
 
 /// Number of GSP pages to use in a RM log buffer.
 const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
-const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
 
 /// Array of page table entries, as understood by the GSP bootloader.
 #[repr(C)]
@@ -118,9 +117,20 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 /// then pp points to index into the buffer where the next logging entry will
 /// be written. Therefore, the logging data is valid if:
 ///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer(Coherent<[u8; LOG_BUFFER_SIZE]>);
+struct LogBuffer<const NUM_PAGES: usize>(Coherent<[[u8; GSP_PAGE_SIZE]; NUM_PAGES]>);
 
-impl LogBuffer {
+/// Log buffer for a task that GSP-RM logs to at its default size.
+///
+/// Matches the registry defaults for the init, interrupt, RM, and MNOC tasks
+/// (`NV_REG_STR_RM_GSP_LOG_BUFFER_SIZE_TASK_*_DEFAULT`).
+type TaskLogBuffer = LogBuffer<RM_LOG_BUFFER_NUM_PAGES>;
+
+/// Log buffer for a task that GSP-RM gives a single page.
+///
+/// Matches the size GSP-RM hardcodes for the root and RM state monitor tasks.
+type SmallLogBuffer = LogBuffer<1>;
+
+impl<const NUM_PAGES: usize> LogBuffer<NUM_PAGES> {
     /// Creates a new `LogBuffer` mapped on `dev`.
     fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
@@ -129,22 +139,35 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 
         let pte_view = io_project!(
             obj.0,
-            [build: size_of::<u64>()..][build: ..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
+            [build: 0][build: size_of::<u64>()..][build: ..NUM_PAGES * size_of::<u64>()]
         )
-        .try_cast::<PteArray<RM_LOG_BUFFER_NUM_PAGES>>()?;
+        .try_cast::<PteArray<NUM_PAGES>>()?;
         PteArray::init(pte_view, start_addr)?;
 
         Ok(obj)
     }
 }
 
+/// Log buffers used by GSP-RM for debug logging.
+///
+/// r000+ firmware expects log buffers for all LIBOS3 tasks. Each buffer is
+/// registered as a libos memory region entry, identified by its id8 name.
+///
+/// The Open RM equivalents are `_kgspInitLibosLoggingStructures`, which allocates the buffers,
+/// and `kgspSetupLibosInitArgs_IMPL`, which builds the `pLibosInitArgs[]` array.
 struct LogBuffers {
-    /// Init log buffer.
-    loginit: LogBuffer,
-    /// Interrupts log buffer.
-    logintr: LogBuffer,
-    /// RM log buffer.
-    logrm: LogBuffer,
+    /// Init task log buffer (LOGINIT).
+    loginit: TaskLogBuffer,
+    /// Interrupt task log buffer (LOGINTR).
+    logintr: TaskLogBuffer,
+    /// RM task log buffer (LOGRM).
+    logrm: TaskLogBuffer,
+    /// MNOC task log buffer (LOGMNOC).
+    logmnoc: TaskLogBuffer,
+    /// Root task log buffer (LOGROOT).
+    logroot: SmallLogBuffer,
+    /// RM state monitor task log buffer (LOGRMON).
+    logrmon: SmallLogBuffer,
 }
 
 /// GSP runtime data.
@@ -159,6 +182,8 @@ pub(crate) struct Gsp {
     pub(crate) cmdq: Arc<Cmdq>,
     /// RM arguments.
     rmargs: Coherent<GspArgumentsPadded>,
+    /// RM state monitor buffer (required by r000+ GSP-RM for diagnostics).
+    rm_state_monitor: Coherent<[u8; GSP_PAGE_SIZE]>,
 }
 
 impl Gsp {
@@ -167,16 +192,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
-            let loginit = LogBuffer::new(dev)?;
-            let logintr = LogBuffer::new(dev)?;
-            let logrm = LogBuffer::new(dev)?;
+            let loginit = TaskLogBuffer::new(dev)?;
+            let logintr = TaskLogBuffer::new(dev)?;
+            let logrm = TaskLogBuffer::new(dev)?;
+            let logmnoc = TaskLogBuffer::new(dev)?;
+            let logroot = SmallLogBuffer::new(dev)?;
+            let logrmon = SmallLogBuffer::new(dev)?;
 
-            // Initialise the logging structures. The OpenRM equivalents are in:
-            // _kgspInitLibosLoggingStructures (allocates memory for buffers)
-            // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
             Ok(try_pin_init!(Self {
                 cmdq: Arc::pin_init(Cmdq::new(dev), GFP_KERNEL)?,
                 rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(cmdq.as_ref()))?,
+                rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
                 libos: {
                     let mut libos = CoherentBox::zeroed_slice(
                         dev,
@@ -196,6 +222,9 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         loginit,
                         logintr,
                         logrm,
+                        logmnoc,
+                        logroot,
+                        logrmon,
                     };
 
                     #[allow(static_mut_refs)]
@@ -212,6 +241,9 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         dir.read_binary_file(c"loginit", &logs.loginit.0);
                         dir.read_binary_file(c"logintr", &logs.logintr.0);
                         dir.read_binary_file(c"logrm", &logs.logrm.0);
+                        dir.read_binary_file(c"logmnoc", &logs.logmnoc.0);
+                        dir.read_binary_file(c"logroot", &logs.logroot.0);
+                        dir.read_binary_file(c"logrmon", &logs.logrmon.0);
                     })
                 },
             }))
-- 
2.55.0

