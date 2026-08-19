Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902F73C1F4B
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111562; cv=fail; b=K4LYLP7swNgBcnXfDZLGVTflTBjYSVmEcpiNkiBfaVf0Ca2DHHAtJLpaqXyZOJEA0ZLmqwLEh4eCrpKboTP2AmXU8TOvc44EoN413Bl9Jkq2RcyivKnNiAPVTVAh04usdtjzRP0Qc16sKHOnCP8xfvFA4U5poWlwReYT/ASTWnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111562; c=relaxed/simple;
	bh=G1wo7s2+JgTRnkfp8P91s+nQiZj7oz4VE2tTuY1Ut2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qJfgNn1dMv/lzG+h8j9nK9K3jSW1shqjelT4m/0pz7+aRSTaRatCcrhm9wq1vHJjTkE2qd/rsZtiI2A7o3Hh5QSc2+vIGBY5pf01OBI8K3nYBOMha0PiKUE7j2kZeJYumtN5tWxQE3XV4U5nCS9gAWvyU+nqNHTc4SY2F8ly0zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L5LhxaOg; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L5LhxaOg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtGPLUmpnMzBTInfKBVotgOiv3kATsTEl16+IWxeM7iaHu9zzMUxDpmSKQuuJSoMuf2kayjCWoxa83UYmlN40avZ2WsVX1Ap8GN3lxkQ61PiHjW92vqBIf+pI3ZviH/BCgdYQrAsOmxtzcbMjXph4hycbPIJ18zKn5QwiFlbN+DZijJYOw+tr3TL0y7zlYWI36Wi6KmNaaSko+cONShiCmdOfdomzfF+Ymw5J4HN4FYdE+H2rbFCHUx5UdnIAChWXRC9UsfaiDlT3eTwOOvJlyLtmWOBIk5sjoQOGcEA5SPCqPmP/JMSzUhz17HsB1Uw5hWF6g5D2VXRaIolvqkvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiFh+TupxiMHy1Sqg0YnMCSTZznQ5Ji/LQCEmXPA/J4=;
 b=enNZX+wMkFoTemXBsdFZUi8Jy0gV+QfXRpYXUyueI8oj3Tin5iKHZ9TORE7naaZNRRLTDhQWrAPviVmlyKX+9QEJSe5R/KUS+5KatnuVL9UZ4Ax5aeB2VS+AlMZgV9h4aMSWcnYhdasvrPsEkGoD/xcFpWN4faf4feGzgBBsEuwArxuVrrskHJFtMnEn0ScM32F/iTw712ya9ihvmwz2H9+E0LLhEI4D759/KAPOxiR9SJSakkWUzuTHYV+2IkYsAqEBt2SVHLkZt915Iz4eeF9hlKiFwjAoHEM4SAK2g5/f5Qor2uMbFSmlozt4x9VVIkWykZy1jjpd0dytAIwNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiFh+TupxiMHy1Sqg0YnMCSTZznQ5Ji/LQCEmXPA/J4=;
 b=L5LhxaOgQF+HcOlEVM48oF7Cz+7XkK6e5EDwGjKfYKpCc9KGhXVcdbI8AbUq+b9UWDifzI1b1xKKQxW3KZcPhOvD34oXxD0vLy7jseveUlVNsyTSN8P44c+w79IEnpV55T0un/wQKmzB/zd50cuySOwIxH4pKSk9NIvLW3mDogK2O9iPLQOJ6vDMnJytGZJG9sHHsKuAmAV9nVyRWIPka1G1/W+jcKQTFFP9KTi+wstfe5gQAzJ8Lyol4vjsypcl2474dUSeIkY1LOw9gg8vvbPuyRp3HOzZdI/39TNT2hrg5G551U5orwiQxJMhs8ZjgvH9rBIJ+S+8GUHTuutCIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:28 +0000
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
Subject: [PATCH 05/27] gpu: nova-core: zero-pad radix3 page table levels to page boundary
Date: Tue, 18 Aug 2026 20:51:58 -0700
Message-ID: <20260819035221.336390-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f30e9da-cbe1-4621-c121-08defda54a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x88qt6WKnozK9FmCjaORKOwh/Une7KXMsB8FpuaNp5Ya+NPPUAtq04YYfvSemhLGtLO2uc7lO82ZdF4RJjGQXdPcxNlZKeX1pznvqBS6NLjrgg+ikZcKyy0W5spZlbrPPnj/i7q5SnOCL6CQWy7ddxsGn0eVJLpCVSoZUqi82wjclvqCsrRxpoSRNsN7sYK42zMkks9erEiejKEZQYutdEP6SVLnOsBEDqQzk3XfiG4Jzf5dsh7VFOv1rRQkn0C5+IE3XMNbx11Af7/tibLAlIsagFZn0e7IlkMLLyObRAW625Vr2gOTgJeOnCotYzP0AHHJ+KYELF8HaNLwJNs0o3HMooEi5h2xFcvxEeCM8ujvLEFSwpcntPIdVsfOI/N/kf+c/FwJgKpR/S5zGSgdij8uivSRj5chql2kCiau/UDtKiOB1dRdIN88LfFLytQogT8KW/b4wFaBDlUQVkx9nL5Jr4hdQAZsoB6TcgFF74ZAauRHVS9vwVRClTOF6aJrexRJgDris1gw+ckXV2amM31Lim5RgJYQ5p54sBSR+j79Uizl+U9IUvr8FjVJRPWGd71Jhkmb/sdOKSoJ/z4AK3VEIMCLxQ+8d9oULFSZIMcf18E6oM/V9Z3K7qWgpfsWc+QOkPPzUCqtAq7f/tfkHe7ISna1rQTUbhbl+/78Ljo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UJ9DbKGOjZqsMlDFISLPO246iuOQYdmOPRSOqZLoIzPC0cnUEPeFjpw2g+Sa?=
 =?us-ascii?Q?Elzvu/Hgou2Ylt8BN/b2FpyAERlRo9uEm1i9+Nh7nB3jH/c6OlLTOHOAT6CL?=
 =?us-ascii?Q?A8Wzsw/+4AtlSS6TANtwPipS9r2cKEkZXMH0qiR62cZfN99yKLxs451AWkDq?=
 =?us-ascii?Q?BS2WjFo2aRTu1f8ERl4XWUw0zjrlqVYC1vKHBy3bwKXr7r1cu2+6uz8HgEK7?=
 =?us-ascii?Q?IJa5meenqHCEtavkrWzMiGRMPyfh2435gMfslVuokCypA33NKEZmLTyCEHUl?=
 =?us-ascii?Q?wtaoKSKMjiz9Ot5f7rphRMr766KRK+nerwvAt7bbdDsMf31D8leWO8kUYFO6?=
 =?us-ascii?Q?fSRIA4qLircxAapl4LJRD0sFmdswOefcJXDSi2zNK+ZTgoaFoHgzuXkLiXqe?=
 =?us-ascii?Q?4mKx/EFdyz9xyhOUuox/ENmgoO3R4+C75tX73p+760Dm25Kyo5i/qQX8tAPB?=
 =?us-ascii?Q?F+XiBgx7aW6KIlg6xeDJMIPLWBKXK4gWtOsJPYT/8McT58xNuZM6fRpPta2W?=
 =?us-ascii?Q?jSlmCY1dtR5peB3mnk8KHDDn5dM1ox4BthCLo9SM/+jOUJK7UGbvFMX6S/Ev?=
 =?us-ascii?Q?ZSk200qV3YbxosOi4CCGhAD+mw1OzoN4eqB8Lqjvii3doFn+iJ8KNXF5l/9n?=
 =?us-ascii?Q?u8R9PERfOyuGmpfvU66x2mvc+v9eQpqsPFZANL0IJQdIoqk3xe/387n201X4?=
 =?us-ascii?Q?GtNy45MDnCE7KrSXKF60DGtaDnFT1Ur7iiW3ZB3qoIGC8MJr2B3BsWvxJIMb?=
 =?us-ascii?Q?ZXHLeCX9fRCqqweT8j/L9hL4vx/K2TTgWa7XWkBG1ec0zry+8cwql04YwT/+?=
 =?us-ascii?Q?vY6tsEgEs0npSGY4Pbotx6qhcCY3QgoPr1ppz/x3Qn2I+jGI2O7G0pgCUbkJ?=
 =?us-ascii?Q?ZVtSZnk1q8rBozpmtPGMF2ZXtVb0Pk9vrqyOVqA+hLkX84oQZJoNyjuYkze8?=
 =?us-ascii?Q?c53hyhSc/lMO/HFVLYr46JMDCskLKQWilwomCksdMlqfVOYkj13LzSEnSD6b?=
 =?us-ascii?Q?sN8De7x+q3CH78qegi7TzfUg5Q0AlCbLBhFd/3XXz+XXamj25GmEt2eZ035O?=
 =?us-ascii?Q?0P0Ex6/6pHCa0+s3RW4K65moHpoObCribj2LyyvOt/Kfqkw8gyznOmbLP5To?=
 =?us-ascii?Q?rziEtWyDDR52b+tlJ69xFHHqM16y5SJzfRwNHvxvXCKBe1/iel7c8ky2cfsP?=
 =?us-ascii?Q?MBEb9gIHIexxOkzZOe8y7izarYusC68Z8Nucr2CTH+8/rnHLcXwlCIhEEP8B?=
 =?us-ascii?Q?6XQ5VXQsNIgK/z4VH58ckEi3o9ENAiYTfyHOeNQFxEpUA2NdIiikM9vU35qb?=
 =?us-ascii?Q?54FDHocsTa/RqEVOhr2Nr74LcIAMors7LBQzSI9wal9pBtLXmknxWb+uIJHF?=
 =?us-ascii?Q?SLIQ6gBu1Uymmp9RlwAh/LW5XLbiDIHZV4rJtojaXhG0VxJNcaPNvfcaSdyY?=
 =?us-ascii?Q?S+LlnHbk8w54DafKW+WpZVxQr26DvNBmTogCjg1wbP3ajOuWv+qJnzfeybuq?=
 =?us-ascii?Q?yBZBry5VV1ZFgxobu7D8vpMWknw6QYCpXVpae7bNanply/i4utZgZYb69gXQ?=
 =?us-ascii?Q?Q2kvGk7hmaWMK9xw4wQ0zP8l5DEU9thUEyvsyGPCBNX1GXnNZbLML4gM68VD?=
 =?us-ascii?Q?Vv3ICiV/dG7zzSNHSJl7rC2ec2vPdGgwd4fluFQ0IvKl4/3b9pDA8mwti52N?=
 =?us-ascii?Q?IxOADzV0vFigbJq4x9XF4ezB1OKY2HzfUCPomdSwclPW8Gskp5FXcnS1YvGe?=
 =?us-ascii?Q?BiFg17cEsQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f30e9da-cbe1-4621-c121-08defda54a06
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:28.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pftLxTzCYbiHmHlWJB4BB9zQorVaBi0Vq7DZQCJxOvcVJupuR0TtL/NAsot8jpy5HTvVB23bR+Iu2Pxyv7us9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

GSP-RM allocates the whole radix3 page table region in one block and
zeroes it before writing entries. The booter reads each level a full
page at a time when it walks the table, so every byte of a level page is
firmware-visible whether or not it holds a valid entry.

The driver allocates each level separately and writes only the valid
entries, so the last page of each level is only partly written. The
booter reads the whole page regardless, and a non-zero word in the
unwritten remainder is indistinguishable from an entry.

Zero-pad each level to the next GSP_PAGE_SIZE boundary after writing
entries, and size each level buffer to that padded length so the pad
does not force a reallocation.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/radix3.rs | 40 +++++++++++++++---------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/radix3.rs b/drivers/gpu/nova-core/firmware/radix3.rs
index b60611c7bea0..f14ad4e82d3d 100644
--- a/drivers/gpu/nova-core/firmware/radix3.rs
+++ b/drivers/gpu/nova-core/firmware/radix3.rs
@@ -67,22 +67,18 @@ pub(crate) fn new<'a>(
             Ok(try_pin_init!(Self {
                 data <- SGTable::new(dev, data, DataDirection::ToDevice, GFP_KERNEL),
                 level2 <- {
-                    VVec::<u8>::with_capacity(
-                        data.iter().count() * core::mem::size_of::<u64>(),
-                        GFP_KERNEL,
-                    )
-                    .map_err(|_| ENOMEM)
-                    .and_then(|level2| map_into_lvl(&data, level2))
-                    .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
+                    let level2 = VVec::<u8>::with_capacity(lvl_size(&data), GFP_KERNEL)
+                        .map_err(|_| ENOMEM)
+                        .and_then(|level2| map_into_lvl(&data, level2))?;
+
+                    SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL)
                 },
                 level1 <- {
-                    VVec::<u8>::with_capacity(
-                        level2.iter().count() * core::mem::size_of::<u64>(),
-                        GFP_KERNEL,
-                    )
-                    .map_err(|_| ENOMEM)
-                    .and_then(|level1| map_into_lvl(&level2, level1))
-                    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+                    let level1 = VVec::<u8>::with_capacity(lvl_size(&level2), GFP_KERNEL)
+                        .map_err(|_| ENOMEM)
+                        .and_then(|level1| map_into_lvl(&level2, level1))?;
+
+                    SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL)
                 },
                 level0: {
                     let level1_entry = level1.iter().next().ok_or(EINVAL)?;
@@ -113,6 +109,17 @@ pub(crate) fn size(&self) -> usize {
     }
 }
 
+/// Returns the size, in bytes, of the page table level that maps `sg_table`: one `u64` entry per
+/// 4KB page it spans, rounded up to the page boundary that [`map_into_lvl`] pads to.
+fn lvl_size(sg_table: &SGTable<Owned<VVec<u8>>>) -> usize {
+    let entries: usize = sg_table
+        .iter()
+        .map(|sg_entry| usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE))
+        .sum();
+
+    (entries * size_of::<u64>()).next_multiple_of(GSP_PAGE_SIZE)
+}
+
 /// Build a page table from a scatter-gather list.
 ///
 /// Takes each DMA-mapped region from `sg_table` and writes page table entries
@@ -129,5 +136,10 @@ fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Resul
         }
     }
 
+    // The last page of a level is only partly filled, and the booter DMAs each level a
+    // whole page at a time, so no entry past the last valid one may hold a stale address.
+    let padded = dst.len().next_multiple_of(GSP_PAGE_SIZE);
+    dst.resize(padded, 0, GFP_KERNEL)?;
+
     Ok(dst)
 }
-- 
2.55.0

