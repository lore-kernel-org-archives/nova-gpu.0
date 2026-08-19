Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0D63C2BAF
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111568; cv=fail; b=eQaZEPYYejygNprs4zOfcEtl46eWS5N1HWAOerhISY996uaWVIuPam22kCEED99NgMjKB8naVTsOCZSENTb1lFYBVpu7E9z3rChZnsqQk51pJFPgI8PQpjsGfCsGFkqH3hOkYUkBiTKVm7dRtFAvyY2F9XtPObnSZcKDnkQfj9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111568; c=relaxed/simple;
	bh=wbfCa/HOcf/KJN5/Q5oV6CMMXYBODBRla1+glrxR2Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G+5cpOwSPiNcMKpXyVIz6eCzHH16p772QXk0hcUlaftrd1Ml41LyzC6YxQ4aMdQTC5QizT+iEzalbCgxa93gecMIhZ6cUiz7bd3XZW4FlZRWUXiuFB+SiKYtEzyWgNyS8d6zcPN+f3laVsfCIZim+rxpFw6j/1mUXawHTMVN4tQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IXLRSERS; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IXLRSERS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acKCGe9xkBmUePeC3yx32mAuGnmJagvTM4eZ2VUGXjJLkD7O6QPpTqGT/Wdmpqk894RCX24k7Sb6Dsq/gXnZG0QNYY839792DAJS23tRWQNKmK3l6Vz2N65txKJO4lVHb6X/jn0/pvbU/0VSQNGhMyUCbi6JeuV4CJQyFHp0xmsEPgOVU2X/Z0qjXbNp9gJF27uX8Gw9u+wFm3k2K1SNcYJVvKQcuZ+qxYLU3OB6GkX8LB6//Wo/J5QrcX+kygRCzm57p00ZZ9mNo5i2EJrYYA0X6bx0arBzMSXsAO1EcSdlVwjPl334Y20BmXN0+mCtHjtILaaSqPDXFwh05A4I9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4Iab1joo0v8QsV5VzXphDU4g7Ipl7wjHSbr4LyYVy8=;
 b=IpniowmbdyQtiV1pAZVV9Y3TrrhCFOXluQ5nEgzBZp7w3cn7HAdoAmHcXfiVo40u5p+L282z3LWHxJFAzgO/AYAgkazJwvhnjEE7sguTKYPAMQrkq5Khqnieme/cE+SXrpE+7JzSxQIT+oURDrY/5DmCzX6A8VQyQpy3IM7yuM/GLiX5X9gUmcsMiJ0nXMgjVFJRVaD2SZNr2yQEXQqhldVdjf0D1YOdiJND64Isc/nDSYLGOLKE+uTudzY4n5S1qCT8mRl1RMlzGRZyCnr4bCVhY9w5NLCPDlktV9lcedbL4s+pnl5T4SZprHyz9ZF2ln5AuVBjLdL2F10cbOamfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4Iab1joo0v8QsV5VzXphDU4g7Ipl7wjHSbr4LyYVy8=;
 b=IXLRSERSMy1Ysb34ognTaELyBVlKoist//WqSvIYnOxgj0Ao/ew25qjrGsAzW+VxKlPwTL4PstxJlAif5q/237aPTUWBuwIjyyNGPomXo+Edr2jc4RHNjRdGPC1G2Lzpii0uCTuLkqtRwGxITgg9gyUXTli9i844tO5B5KZy8KfUnyT0dxBWj4wKh8n3cX5TNpmUZeUdKcCJRA7/+FV/wvoGu87OxvXtKcd7W/qGLhSuimA1u59jz5i6K6zS+eg1x8tlc3Oud6bqX98QZKVNkDBm0+JWpq1oXLG3CJkZ5CZAB6wtYGkUIwGyXeHreOown0bkKTfJa8XhGDSmLB0a1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:32 +0000
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
Subject: [PATCH 08/27] gpu: nova-core: add LIBOS3 log buffers and state monitor buffer
Date: Tue, 18 Aug 2026 20:52:01 -0700
Message-ID: <20260819035221.336390-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 16273476-467b-4423-4487-08defda54c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Uoh2rrbasWgHdl0LVyp7PPgzPLcmY7Q2vv3jdj9YFOVdGtoYiHBNgLZthPAsxFZwulRF2DEo7wBMLzzTcrVuX26d3ny36T8e+jR+9cQn33ULd9S+apvfuvJaUEAej3ZsHg6dMj3eqFDBkrtRkE5i94MoPEJxKlGWI8luqhnLRIxgChBaw4kxzZW8lZ4ceKtQOFPllfB5dKkiEwZ+C4LegRhSXMk8yYWIWte+03iyTpWLwqm648u16Shfcvq/1IfnM6/tgEnyuj2yelK8FVO9cs1BaK/Xkwt4RT0Y8BT0PHbA233JYaRY3OLPzYxO66fb9PlKP4k9wWZxYp+D8oyUlHBIqdm9eaR8yonjQU0LNAH/SuJ8u3RnAYuxgzz9MeqTTYtt1G6RjKmaWPXlefp/iBSdg6RBF1nrU3AEdefwMb2HxYPFb5R+OfWze3+1GFxIfHXf8V/sG9YJDmGL/pTPkzLm91vgruzNLYLyePmges6ffh+YZrxswPlrZN42Foea7CcZdHkWLg77CB9YdOqyY10+I87P2jD4bXbxp3seLgQ4iZ2cfnB2d1y0bzJbE+rsD3XgZrZkTKBj3ZazJzpX8TtBXDkYK0WIOpyAo0cWlvdAssiwwh31QnGSixXsygeFw/BKqSo5iuNCp/ZFaXKTZXNj7gzTGfD9muRazKcgeyI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pyxlExvq6Qi/26jwk1jDu+6hc5xtSdxnno0jWdyJMat7spLC3Q+4xhPIN9C5?=
 =?us-ascii?Q?RU+UntLlWEXgFMH4TAz6wRicgIRt/hFuHdskVJj+gYT5vh28vq98EZxs8SGS?=
 =?us-ascii?Q?oRSGJievftYFwOIyEMcOM5vcZRWHQtrugrPGsNSF50LPvac7/F5dflcrMVFy?=
 =?us-ascii?Q?ZVkSwegSinIFMaOasaLTU4w/azev41sx+1pSl9Z8FddZO9xO8WX0ncmZEY1+?=
 =?us-ascii?Q?ioCNrf8dl+jm5nYB2qxfQP5WUlJ42Bz9/Q9siFs73HKAU57tc23hjD90VCYZ?=
 =?us-ascii?Q?+do9EFMBOitv5tzT6pPYlNUhZ7zDcvlpjGvELfdQPtk39dxOl2tJd0mXNpdp?=
 =?us-ascii?Q?j1JYjjuVfhFu6Gm1PCoZHY8COYnQCbAQM5nTPVnHubRFYJS/wkPOswPLnPRr?=
 =?us-ascii?Q?R6M0/o55Uoqp0ThdzVc0o545Wogl7NP82HdKLZdY0Bmc6b+JGsNVziP0FQ1O?=
 =?us-ascii?Q?iyu04grwBcPsAESxZEKwjnVip1LXZAWObi+zgSgFsgscB8QR6hoheLLOJ0rP?=
 =?us-ascii?Q?VynXgOaFKNeDQSybKfhQILyDT9SqXH1vPCZUvN3jJiZdOxTrsv8ToHWg2eZH?=
 =?us-ascii?Q?XwvX9LRlpHCQmEpMTmiQ3B2Txa1+ozYrZbh/raNJgSPBr4JDTgqj0K6hCR1x?=
 =?us-ascii?Q?53Y0mXIxtm8BbdEdT7B4CyKRh6Go7J3qrRNx0wCY1QOiZi7+4wYPAkUnW2hl?=
 =?us-ascii?Q?oxBDGmuFjVCnWEiKkR/6ptKLcNqMrXQ6LfMZujpeNeyIfsitt9IMSNivkyyl?=
 =?us-ascii?Q?S4gEqmc/LCc7YWf3INirYK3y/lgbqUDacS9iTuK5eBIjmCZXa+9GfxzyxuRS?=
 =?us-ascii?Q?TQ7dne0orIQns/NqhgBXwWITJ2ozBgJGk6FLDlOVRyvutHzsw8mWQpyPEvia?=
 =?us-ascii?Q?GfUIZ4aqQ2do+tD6ws65N860mBhgDxDDOcLLNBdrUP5sgjJb089v+woLoUZ8?=
 =?us-ascii?Q?C5sSYFEh7sRcbhZtwSNrlLrVHNkYVgW704RijCxS2WaC1zbHc6fcBAV55PJc?=
 =?us-ascii?Q?2nMOZuxzRclj+pv9tvz/otKy7kEVV2bZrFZhjqbRJX6wNg0QyPLLaZn+HXlY?=
 =?us-ascii?Q?73DzXZC6YuBfXUqApdSoHV1AjNapJIo6M7VSlO2hCdkcPHxuLqz+qv/ZFPRS?=
 =?us-ascii?Q?1dMMEiAiyBCnqBz5AmDApAa0LVTAYv8ZE/agL6V7oUKzYPEzdDBe1qMofXqH?=
 =?us-ascii?Q?7AlTXF8x4Hkhg2JLDMXwczbmlg1v+tZJvs+DuEatT6KHiyrCPGCrSbe/+yRR?=
 =?us-ascii?Q?8cSHoEFlHLtQWDYxE8jf8PguHGJCzHPLiUlUaO8/LXvK1yKaHS5cxloN9C5m?=
 =?us-ascii?Q?MwzM+UvCaaFuNPnekHBkfuMq+OhtnON94Ld0v411RGL2S3U3KgvxWvjNLpFd?=
 =?us-ascii?Q?wDdV0JvaNdmyLhEvXeiePdBCloC7GEW0d2M7vpWpCZst+KuroRLinvIGrOUk?=
 =?us-ascii?Q?2pGYkMdGezVhSz0vHEtxHRsw39q38U5Xdow/AT6UpLoNL+XVz3KsM+DQQeUd?=
 =?us-ascii?Q?5815p03ahJ7ChAb5iVY6ymQK9ksG5Yt1twvPzk8nibRfEiMdRcExWJxMzxbz?=
 =?us-ascii?Q?ckLV8IYiIvxT5kd1E9eDBbqCGqUJk5OWlZBHgWOpAQuclz7gCyoNlQgCSS0U?=
 =?us-ascii?Q?Tb9h0doSTJ7XWCHtS0BNkdE7ra/qO57UuzCzoxlscxnWXBjGnwN2Gz9aJA/I?=
 =?us-ascii?Q?NvpTE74thIcWnGplSgz0Gdm4Wof1TMzaJ26TXinuU7L+Bdo8AIrPLvfmvqBm?=
 =?us-ascii?Q?rDzIGRemcQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16273476-467b-4423-4487-08defda54c2c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:32.3760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GRNZu/Qy3bY+VnrJv28HBoYxx3LEmtLjbOdCXCJnJLVlh8n2TedABzTPHzfKIlSb9cQvtcjt8PnNEDQJ6arsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

GSP-RM on the new firmware logs from six LIBOS3 tasks on GA102 and
later, where r570 logs from three, and it maps a small buffer during
init to report RM state for diagnostics. Turing and GA100 run LIBOS2,
where only the init and RM task logs exist. Two of the six task logs are
a single page, where the rest are 64KB.

Allocate the three missing log buffers and the state monitor buffer,
give LogBuffer const parameters for its size and page count so the
single-page buffers can exist, and expose the new log buffers through
the debugfs directory that already carries the others.

Nothing passes these to GSP-RM yet. The libos init arguments gain them
when the driver switches to the new firmware.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 71 ++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f9a622edf299..f19a47cf396f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -118,33 +118,63 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 /// then pp points to index into the buffer where the next logging entry will
 /// be written. Therefore, the logging data is valid if:
 ///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer(Coherent<[u8; LOG_BUFFER_SIZE]>);
+///
+/// `SIZE` is the buffer size in bytes and `NUM_PAGES` is the same size in GSP pages, checked
+/// against each other at build time. Computing one from the other in a type position is not
+/// stable Rust, so both are parameters.
+struct LogBuffer<const SIZE: usize, const NUM_PAGES: usize>(Coherent<[u8; SIZE]>);
+
+/// Log buffer for a task that GSP-RM logs to at its default size.
+///
+/// Matches the registry defaults for the init, interrupt, RM, and MNOC tasks
+/// (`NV_REG_STR_RM_GSP_LOG_BUFFER_SIZE_TASK_*_DEFAULT`).
+type TaskLogBuffer = LogBuffer<LOG_BUFFER_SIZE, RM_LOG_BUFFER_NUM_PAGES>;
+
+/// Log buffer for a task that GSP-RM gives a single page.
+///
+/// Matches the size GSP-RM hardcodes for the root and RM state monitor tasks.
+type SmallLogBuffer = LogBuffer<GSP_PAGE_SIZE, 1>;
 
-impl LogBuffer {
+impl<const SIZE: usize, const NUM_PAGES: usize> LogBuffer<SIZE, NUM_PAGES> {
     /// Creates a new `LogBuffer` mapped on `dev`.
     fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        build_assert!(SIZE == NUM_PAGES * GSP_PAGE_SIZE);
+
         let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
 
         let start_addr = obj.0.dma_address();
 
         let pte_view = io_project!(
             obj.0,
-            [build: size_of::<u64>()..][build: ..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
+            [build: size_of::<u64>()..][build: ..NUM_PAGES * size_of::<u64>()]
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
@@ -159,6 +189,8 @@ pub(crate) struct Gsp {
     pub(crate) cmdq: Arc<Cmdq>,
     /// RM arguments.
     rmargs: Coherent<GspArgumentsPadded>,
+    /// RM state monitor buffer (required by r000+ GSP-RM for diagnostics).
+    rm_state_monitor: Coherent<[u8; GSP_PAGE_SIZE]>,
 }
 
 impl Gsp {
@@ -167,16 +199,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
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
@@ -196,6 +229,9 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         loginit,
                         logintr,
                         logrm,
+                        logmnoc,
+                        logroot,
+                        logrmon,
                     };
 
                     #[allow(static_mut_refs)]
@@ -212,6 +248,9 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
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

