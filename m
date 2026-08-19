Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8883C3434
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111583; cv=fail; b=oM1CAeX8ALtiurVvgCQ15gmPBB8//vQq03yAR6RErj9kmcVOze/dmFYXbA+Wjuv8DJz4QGcTZb47/xXJ+70oi/O+O/kNJvn/kdVmoD5dvnThCER00tyD99VYxZGpfzt/Zlo6q62FaxRmnh3D6lxQfT1hYP/yhf36G8UW5IUQcgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111583; c=relaxed/simple;
	bh=0jgx16ow7VAYV8ah4ydLL4r9AF7lHmAoEheAfzVANqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T03XGLce1oYrr6MfP1JtbxGB9FNBnaTlFpyS9J4+Fp2CgMVxa/K2RWcu6O/DXGgc5FAPgnCUNXetYuAuawiuO0NV8HDZcgftrC9ivfDRw/+oGRSQqH+8/giti+cQ4rL30D4TrORYxspAtchs8w61CS/flfRz5m/6VeHwB2OoZ5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HlLp5Eak; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HlLp5Eak"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngz4TF0bqK+bPugbTh4KcanF3NfXuS298anQpmb3kK2lAMAz6iTgQDdVnE45qHlqobO8oz8jlyJd1BpuOLzoB+33pAzPNGWvWiW4/a873c4xJXbY5A1lrQBjVCsJgLwMvF9tAfmWxafjEmZ7wMAtDxXmJ8HOqP8j2QJt7jEcgFRRrI5X2swYX4JkXC+gtBhxkfKsH3ZvjY9vQqf+/ES8dDr+6mP6YNvziooRAAN3TO2tKcVZe2hCjRZv9OGRADTRqrMBEY9u266GItFF4Jm7Vu5SKT4jtEbIXQRK/mtZJeFWTpufBZEDS/y0JAGJGeYjf2DWoZO4OTRhUojnaqi0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsL4Dr9TfxrGsdEKSNRtaToAxDlqPeU+1zWwPDed7Nw=;
 b=f3m9gdeuFluzDLFyW1mEpbuGuBLum4B46NiDs8hLHbBo79hdXhlfcwQhrgxV8C3GTXKHsTHggjcZcMiw488ITA9CueOLo34vSNkqEHy+fPoqu0M7BFSbQVzT3/5P82xThirLWZ8plOxbYhy8uGlQGIapBfnhBKT1wFCSZaM0W6rUhWEU3ix9F5/DVhOwdYT1TkWFNMSUD86+mrnqk8tq3VxfEZoXeZUrDwBKCaEb8vXE1KnBaUbt8YCiE42YGs4bgkrEpP5z/is/YczfaVvd07cUsgpbxXOcBiVsNDt32bsrmciqf0eAuoWHajHCkQRnZdc57d9Iai6ymEDPvdSLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsL4Dr9TfxrGsdEKSNRtaToAxDlqPeU+1zWwPDed7Nw=;
 b=HlLp5EakqC6lvYuPstUOhOOU7B30wtIcN4Jq5e0JJ9IfpP1B3RA/VAosyA3uHPo4aiHdXP4i4C/Mh7COZMVxfG5wYxyRDO1TCzWyDKMcTh3uCpmeqEZCAt591Y2LKBMRnxgpeIwGsGRgT9L2QGMSYB6vw6QNahER7TRe9zsd3Ha9UqLUY0CpPhOOYhJ4ezLs8UgWlIwK7Dh6AtdH0xcjlaaazyyG68nDKHOk2PmyQiW+24pUDaCiNqurEFuXrgi8br4PNFylKTZ/smo90Gj+JsmNsP7K/GyWyK427+JoVYCYDtFtbeFcueyWxN15TSofWF3AhFcnu7JouVKMmX9JNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:38 +0000
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
Subject: [PATCH 13/27] gpu: nova-core: generalize allocate_command() for variable headers
Date: Tue, 18 Aug 2026 20:52:06 -0700
Message-ID: <20260819035221.336390-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:a03:338::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 539eb993-df46-4209-2c5d-08defda54f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1/Uy28lJi5nKNc1ADDau2W22uFZfCEwmW59W0OyUbl7Ykly38oVmm7aZ4ZntYBLiKR0pQHsjL2smHykfkmvGmEfiNVx0XqZLYmaN2KZlicTQAnDdySw+iGRCRgyEtnI/f3Q+C1WPNb8nWeLfCnx7QhHXs2J9BmsbkWsSWo7O5qtl1pK4dhmpc8NcfGM62X/kls4a2AebRwLLrQeXbF7cjaziAyTP1TEr2GQpPMJG9RgiPVaVUMg6h187QjR2udle7w4uVwfOXaYivpQnbR1dhrTln3jaspqBYoXjxutdV4iBBl7IiMfERgXd/QCXhPt10G5wQruD6ez3xLAc2mvH8j4OmrvaNtJZAge6I9uplLLdh+EqSQWDHQ85CHvePy3SVrxIHkW1fkIH8PVk8pjLbm9Nu8Ju4/BNt7S+TOo4cLgcVIVe6dJP5niQkRZYp52bLlb12D824Ijxv6/4uENtX82G/1tQC6hz+rvY6IZA2rwSPTf8RFb2hrVgCs4qtPN+rALnitemOYF/zIAnh+yCDnXs5CkfeW2JkRE9rgsoyqsHk1WBR6UkdYVhJcwiO0rSesgRHvUnW8J4C+Nfp9ro/DtT/KvHO+cnz6A+/c+Z2kHnAcqGFh4p1IZBudpfCn4WR+qBCTCt/jdOr+tsa0HxbBwI48wbpwAsUiLkJXkQn60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OVnxw7TqqsURadsEjK4gUabCDiyb9Y7gkq+bxga5azEvJ+EXUAcpo1ZfNJ30?=
 =?us-ascii?Q?lS1Dxlz4UqCkDSQbedzMDSqJknj3z8zkxVHEXXlluG2j+7b8lULZMY1qmADQ?=
 =?us-ascii?Q?khjYgCyJGWY65Hu2Y8p4qQGYbYfih5/a3/R8YijM/Bw7hCpEDoxeCqcLiBFC?=
 =?us-ascii?Q?P3t9jeu8QiqQbYnjbZrt82KJwtPBHVmHXY/eb/nQUNSkx/Ql58Wrk2gwnJdB?=
 =?us-ascii?Q?f7aUZ197YQPQgHh4xYDOdyfb/198xG5N/cDudDk2HTjV8K8Hc+wreTT1eYFj?=
 =?us-ascii?Q?gIAQGR4OAzLnzIWQchqy+Xejj/kyxsllyFZTYIdOUeDBhXoGTUg4VIhmalzC?=
 =?us-ascii?Q?oA+kWyCY7RvuPV2rX3flQvAbCCzLwUoXoRVqTUDI+s84sH8/qTtTbtJLNFLJ?=
 =?us-ascii?Q?kGMQYEeiKZ9uBhwWbLqMmI9cSext4SkFexKTJXgwQcDPHHLl4DNVa5+1Wgag?=
 =?us-ascii?Q?Ngro5W2+WFt025v+OuVuzs+OQ9xXX5hbKue5ENZGng5z6bpP3HQ7BBHSmUV6?=
 =?us-ascii?Q?YiqzoSD5zjhU9Ioqws7Xo89V4zw872mnhKyMCLAlmoIYJmnKWggh7ScFZ30l?=
 =?us-ascii?Q?F9kWhrbiegnnid6KrheRkVy1JHBO6EBEo+voOcYzXeHEVMqRmu/zITvv2h5+?=
 =?us-ascii?Q?g/1rZt9td/wvrineXeRMKbH8z/ZosxYco7xNRc6qOF54X0uytuijQj8belLl?=
 =?us-ascii?Q?CsU1j5QkNjelvDVOB/TUaijj1ZYXxHs4TgAPxEeEEgc8woSQBlqX+JReI4Qw?=
 =?us-ascii?Q?7jC3oJteiwu1p5c8LIS9dQnv5P4HatWZzq1WlcJp5tw3XCzQ9SdjqZbU12Wp?=
 =?us-ascii?Q?8BZTjQjCASRf/MG/ThL740wxdSregXQ5H14X3POj60k6nTwIDgCpEIZMkmCZ?=
 =?us-ascii?Q?BViDyQVvs0a5N7jQXSJ/hOqokXxyATEt/qRihtUuykVyj5s8dJWDdlowzLVB?=
 =?us-ascii?Q?XgcfOp1gWrS7beoTqZPmjdY1/KUnP3T8XWp/YT9odv1KgSQKklp0yBokhUAv?=
 =?us-ascii?Q?llBrLSIqUjp/s2nh6J+No7AGi+InfzgRUNLSyJpqZSxRdvfYVlz8Vyql1wG/?=
 =?us-ascii?Q?VOGqWZ5m7fpkZyIqxT7+R3MgpAff2okPaZrWKVR26c6JdA3cyuJ7OfJvPXKp?=
 =?us-ascii?Q?x/zYEwmKiG+5a9M6UMxskR8L71LbbFufOOjBDlSJ5jzZB4a0DjYxlFZqc7z6?=
 =?us-ascii?Q?NL0RCfd+CTLfX5RB6OugkidQfJVSvghqgIUNZHjY0AShco+E4Z6T2ScNF07m?=
 =?us-ascii?Q?ljNiuvp5S+gFFBRxdPuX2VNdzlOqEtesG5E25wQtA2X4sKB5KJDxl3ViziWP?=
 =?us-ascii?Q?0h30ikSTqfSS017oG2r0GU+s9Rv00tT9375y1IVEOfkyF2EmRHA7TVZCETyA?=
 =?us-ascii?Q?/eLIfMV3NcBAlPLm4O3riQsIxDonx0+uS2GYNmxL4y79TBZ/4640Vy4DlaUz?=
 =?us-ascii?Q?6qynXP1Htr/TkJx8PYiM/+v8DfguYAs7ltPppeg4LmmM6TBiq6vVV8IlqLgS?=
 =?us-ascii?Q?x+A9xAYV2FaR9TPC1bIlLxECTTws6pCBnpRjHb6YJ+Nk9xbh/UKfcMCkpMOZ?=
 =?us-ascii?Q?RwMiVQ8RUKLFKYSHoOapXBQTF2rQpzMEO4l9hBlkbsGNc6nvycQnBm56vmz3?=
 =?us-ascii?Q?ETIdeiHUhEXCCIuebnPiyvTjU219alyWGdA+qWSfsCUCyXrSb4UrXsf1m0hV?=
 =?us-ascii?Q?NVcHOmjraCApshs/loLRNDxg0jUAc5XEjMvR7i38OuI9ZMIvUCAJwQLoXSGJ?=
 =?us-ascii?Q?HL71zlM+IQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539eb993-df46-4209-2c5d-08defda54f90
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:38.0808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLjRBcUo3W52GJQaHx0rDDRH5NTiWTNx2KEVg2ayqMA9/E6jYv9eUx3id1GkWR5D9Mcten6QpTNHD4O61GfCFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The GMC command path uses a different message element header from the
VGPU-style RPC path, but the two share the queue, the space accounting,
and the wrapping rules. Make allocate_command() and GspCommand generic
over the header type, defaulting to GspMsgElement so the existing RPC
callers are unchanged.

No functional changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 1d86d2927a94..0dab3d279426 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -365,6 +365,8 @@ fn driver_write_area_size(&self) -> usize {
     /// Allocates a region on the command queue that is large enough to send a command of `size`
     /// bytes, waiting for space to become available based on the provided timeout.
     ///
+    /// The type parameter `H` selects the message element header, [`GspMsgElement`] for RM RPC.
+    ///
     /// This returns a [`GspCommand`] ready to be written to by the caller.
     ///
     /// # Errors
@@ -372,13 +374,17 @@ fn driver_write_area_size(&self) -> usize {
     /// - `EMSGSIZE` if the command is larger than [`GSP_MSG_QUEUE_ELEMENT_SIZE_MAX`].
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
-    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
-        if size_of::<GspMsgElement>() + size > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
+    fn allocate_command<H: FromBytes + AsBytes>(
+        &mut self,
+        size: usize,
+        timeout: Delta,
+    ) -> Result<GspCommand<'_, H>> {
+        if size_of::<H>() + size > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
             return Err(EMSGSIZE);
         }
         read_poll_timeout(
             || Ok(self.driver_write_area_size()),
-            |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
+            |available_bytes| *available_bytes >= size_of::<H>() + size,
             Delta::from_micros(1),
             timeout,
         )?;
@@ -390,8 +396,8 @@ fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
-        // Extract area for the `GspMsgElement`.
-        let (header, slice_1) = GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
+        // Extract area for the message element header.
+        let (header, slice_1) = H::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
 
         // Create the contents area.
         let (slice_1, slice_2) = if slice_1.len() > size {
@@ -609,10 +615,12 @@ fn driver_read_area_v2(
 
 /// A command ready to be sent on the command queue.
 ///
+/// The type parameter `H` is the message element header type, [`GspMsgElement`] for RM RPC.
+///
 /// This is the type returned by [`DmaGspMem::allocate_command`].
-struct GspCommand<'a> {
+struct GspCommand<'a, H = GspMsgElement> {
     // Writable reference to the header of the command.
-    header: &'a mut GspMsgElement,
+    header: &'a mut H,
     // Writable slices to the contents of the command. The second slice is zero unless the command
     // loops over the command queue.
     contents: (&'a mut [u8], &'a mut [u8]),
-- 
2.55.0

