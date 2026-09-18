Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54137A494
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693667; cv=fail; b=sKyqP/pvNr+in/4/KWLTH9ymyTc3U780dDuyjG671iJjrSfUVivVYCqX0zMDUGE3PZyyUbexDXuRlVin6KfZvw5wOrOxTSzn3zYmsbrnRySeGSWCfZwbKfXUqiRJnp22BOFFrEqMbclNHuFQS9v0Jjdt8DUNGlanBk5Oh7P36rU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693667; c=relaxed/simple;
	bh=afxL36pZtgONwioSKQT1Ky+0osPt0OtkhQjaz/KbJL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opt32xLHuw2vJdfXjI8SBvzfL3181IejbKv35AORPtpSwVtnmkynWxNx0w2E63oYdCAjF1S9pni72uDtZvLkqYzaNdpaK+z6UIE4/ZHCHvHUsDRfTb7Ab+IEyV55jbcMMt+FU4/0xatZf1BUaUI4UGftsd/Wx9ZNTeW7iPaPxns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xt1VUEoH; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xt1VUEoH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGs2xYqyQC7wrhoLu5/YsKKvUCJzU3PTYbqW9EdxRB4j+Zi6dkodCiPKuJkZvbb6tE6bg1tLMmikgXtoEdJJTwKOdpNxA/HxNGGzlmLwZKa5obIXY8sSVoAeO7rayeotURDz3QC3TturosLbDDp9bKTVIjNvHuA8qY7dmYP2cZV1HvFgih9JxzqHeDE0lCN+VG78SL9nWSUsYY8AFO/PMhsM4+mjwcsaBIRmye6SyWzUBXFtFBepdY70nFAHZ+X3RZhhSp4jM1Zo+TqSF0BzUnvktuIZtRw+Yzd8UFDT1L7Um+ddgGdHuxUqWWNyhahp6ay9F5OgJDPg6SEMy/gatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INeHPZ1OagzHxJHBBUgCVtl18nv/Pk1qNkyRSxVrboI=;
 b=hEiqKgfo0gInqbLHttITVav+B801VdRp8XrNM9JnM+Cs92FO3b/MJ+cJgY+ScrMjkBLKaIMrgaIaGv0vdC5yc4T+ME1dTBacFqKuNCdq5iHebc9a+TqQ5HFs3RykyMGVWKZf8M19JppnYNuUkCwhesL7PRKcbsdHpZpj433xOHyM44U1biWtXIXDMi1SQYMcDpPQWiNCnh6TVBV6So8LSQEyaVscGdvjmH9oHGECkxH0petaHafsuypjKyYV/Nl6TpaAPT9K5FS7I1Rt9ApYUSw0g67aKhHu66DFnKI3eEdNHCuZoE0wFgZgtIOquRi7a0vIn44atsBqDtN7nM/uyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INeHPZ1OagzHxJHBBUgCVtl18nv/Pk1qNkyRSxVrboI=;
 b=Xt1VUEoHY10sd7xPb22WOhMpZvnCjRoy7HGOlcf7aSVnWzlUoZydCVn2/JJZW4AZ01/NQujRxpTYySWA03iijvD45bQ/m7voKToa4loefwdRIWAeUT7UdHovyOCukgS8ZIs0gr4UTMh8Dsf4b3I0MOhLefxmSQGEVuKL3MZgQrtt7Owbh/PVJ0YgSXWPdC/5zoUD2hnnm6uYCx8gEkDF+B2OaD4M+UU5nclW/dOQqSgDLmr2gTgDxvnAxNXk0xg0Qrar6HQzbkTLUiATrr2ZQ7dZjBKtgrHxHai1y2k7+elj9zJlPuJ3K+U2SiZXmJ7s/GJ4SJghAydGHanoFts8gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:32 +0000
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
Subject: [PATCH v3 06/33] gpu: nova-core: gsp: ring the GSP doorbell from the queue memory
Date: Thu, 17 Sep 2026 18:06:52 -0700
Message-ID: <20260918010719.1176945-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d593a92-ec89-4667-3914-08df1521376b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	c8S4xCy0j8mIMBbQwtYXdDYQWh1104+E4pSLnpyvQNNvQ/sPFh9wT3juC8lZdy8mwuS07jlVErNjFIUL5uy0FtctX1DMub9zR8OOO99mZkvWY/nFSbjI9LCz8zJS4a91FeoLlMD6eGIouRlVp4i0Ml9ecrGeU3Z2/Bgk63Daqtfv84TQAzCWoa7KBZnlgmHxliXTSA2m4tkH8hllTUOaKLsLv+YlgxXX1XZH/bMEUGJdSCv3vhtPqVyRRJcFyZU554ahku98PMuSRIHlUY8G8T7FyGgHqZvRN/KEOQ9fWsdiFaXhDBKM663FTMpjUmNtbMzcv1ECBKDDFhHX8HF+91WeNLXVnpQkwUZOEueKPrsCpXQXET9QyG6UQYHvyw1sdWoqa+v1lgTCH8uqq04oRtqiODu0mZ1nCIXSKj61kQWKdd9cCW/Shsagclbo5rvMkHcofAR5R4W8XLuJjsELZ9UwA5rL4+bwFFqZf8lI9hlbeVRtcZ4xN/xTiYthdUfuV6j6eUEapjAt4u97hcHfKE7oLd+oRqSRC9louLGU4JBsTIGgpK5Q3KRvgk/utLk/wFaUwaSvzutwjoVHHNEuqg2C+wNSCs9+p08z89IQpaAQtJIEZYod7pdN6BMRw39JVyofcK+ETNOjjqLJ28hVAv05zCII3ufbT64VSjzjYDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0087kjKbMjC4i53kJbY/rPwLozCSzLdAGkw1DlORbEGqTCwwkm5rplj63Uf+?=
 =?us-ascii?Q?CjlsFW9pyk37cJe0PZJzaLRVNS4cG7s5GLXvTATNYPIrSea0yVfXWuOgiCAY?=
 =?us-ascii?Q?/2/vYDFEunnkIz+kwwL9YA+ld4A7MGlU1bLWzc9PLWOhtI7ACgQFkhEIVdlF?=
 =?us-ascii?Q?5F9H9rVaYWzpK6n1Sv9i1RCVdRUMVahFJ4MBay0Mlc2p18wDFk2urgkDqTMB?=
 =?us-ascii?Q?kXTuqQMoRnfYXmCfL043Qn0mbOH2QmRyz9U3QnQNFB1k+sPJvNxWrfU3Q8km?=
 =?us-ascii?Q?f0eyxQP9CCP6Mh+f7fjhUrCzOD+5WsDwLuzb0P3pWuKWBnbciQfxg6QaOD+s?=
 =?us-ascii?Q?wQlqIvAkySCxrUiNvle4Y6lbLwDN/LPsq/5eod0uQe1kwZpw2cKxnitURl3v?=
 =?us-ascii?Q?VGJmHOToPs5x4enQU5yw4JWAnNbQRDs1g9Eo4XH1rcMeGqNvsPd9RzgDFkW4?=
 =?us-ascii?Q?5rFEfPmRoDs2tmOKPbuItepEI/2bn5V0TY5HGDKiAqCPQJYovrbxT4Ij9v+z?=
 =?us-ascii?Q?K7cmb9GQwCSFlHDMhvbETPIhz6VtxOJ0aR3+sB9sGK3yhbrddt67xINEqGD9?=
 =?us-ascii?Q?v97wsXDQpiR1xVcBBDWH86K7ZCdZ9fo/P3cj7X/p18u+LkCkj7CGmOWXyWxE?=
 =?us-ascii?Q?X6S+NNdgnClF4kJrRdtKdOpclehlnYXGi0cYLBR+GiM0EAzmCXXAmNTnEeat?=
 =?us-ascii?Q?kDrsbZmSSWrX+wMX33h6s628Wr8ILQ7KG5yvUCTWMUKScbvjnBRH+aJzulEw?=
 =?us-ascii?Q?Ut+cyfo6jJJ046b0MRjwPHth6R0VBnATo1epiYqx0SgqeGBIYcbdwiCXGV7t?=
 =?us-ascii?Q?yKwdRE8CxrnKDJULGyuj07B0nhT7r9SwK4fZAiSaOAFJPqtn3OTX4L3KqsRm?=
 =?us-ascii?Q?S2XYufdBIqq5/2qCDIrMHiMkdAVnBahTPfmdbNmzSf5SA8eyNmXY505hnXOS?=
 =?us-ascii?Q?hob+pKxHcTYIo2s3lKkn6yFgC9Sd6py5uKX8vRIdNFdNKH/VAMmp5/NkB5XJ?=
 =?us-ascii?Q?VyeHWE+Cid31I4exAjaW/myYCPZD5DMo2mmc77kn6w7zFW6vsFbKgqdJs7x3?=
 =?us-ascii?Q?207Moqxuv/I82cUaDQrh5F8l9E1mFvnLNH9ZVPm4Kxv5AyMDdSt7iIz5IrC/?=
 =?us-ascii?Q?xCbgchYXUx4yhmbnjqcxevoKKsTKVHh5VvqT5UJMZqOQWb/ccIe8LUNj0NlD?=
 =?us-ascii?Q?pO826co5trwHVKdI+CUGuD2wfaHmkjRNDYmkosHwvHcYXmYk25G2yYJQZCaU?=
 =?us-ascii?Q?BzPOZyImZ84+nTXpeLm79+IZYWhyesVpGqS3dYbvQhc621ZQAo0g358mF+5V?=
 =?us-ascii?Q?XaNW8WRvUDkJAei+Y91QNEZOnjXXCXi/bTjrHjmoJj4E4YVrl9tRFVS/08g9?=
 =?us-ascii?Q?IHv+hWIgpU3RVHSBEvuZliTPefT4BFJVlR7K0WjBLEOkOb5Z+BbZIq53vT4p?=
 =?us-ascii?Q?hirLGfVPkGkqXrcx3f00XR79q6kkLPOd8SgZj+gYATT5i+vpbw6dSvFrU7+v?=
 =?us-ascii?Q?wNqhw9DZ1+pKjsUO2OyiZwd0o4XKyz6q4CP04tGaLNElCIsru+7/Hi5gdTZa?=
 =?us-ascii?Q?Zx0q6e8CiiXJmLl6tjxt3k0A9YtVeDeNtUVKN1b3lPWxB3vJ48ArGRvYFDFC?=
 =?us-ascii?Q?wL5rB6S8jNPMeqAAdZXhzRG2bRMiB7P9mPqQA9p9wkfYXLRTHG7xKCRAlH2z?=
 =?us-ascii?Q?7x0kiVOX3V0fttSgQtEFV6MGespCzKLBbbjpeIDWOKm5qDyYxwP/vQtRTy8m?=
 =?us-ascii?Q?SlHhKbf0MA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d593a92-ec89-4667-3914-08df1521376b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:31.9237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2s2uQ+UZZyCB3Nrhbwc9gwQtPTv2gbYk/nZxeUYH1GuYSvqhqc/hp2FG2OwmtOcWdrSf1k6iV7Cy2q6ZC7Q9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

A command reaches GSP-RM in two steps. The driver advances the command
queue's write pointer, which publishes the command, and then writes
NV_PGSP_QUEUE_HEAD, which interrupts the GSP so that it reads the queue.
That register write is the doorbell. In msgq v0, the write pointer is in
the queue's shared-memory header, so the two steps are two writes. In
msgq v2, the write pointer is NV_PGSP_QUEUE_HEAD itself, so one register
write does both.

Nova-core split the two steps across two types. The queue memory type
advanced the write pointer in shared memory, and the command queue type
then rang the doorbell through a BAR0 mapping that it held for that one
purpose. The type that advanced the pointer had no BAR0 mapping, so it
could not have made the msgq v2 pointer advance.

Move the BAR0 mapping into the queue memory type, and ring the doorbell
at the end of the operation that advances the write pointer. The switch
to msgq v2 then replaces that operation's two writes with the one
register write. The switch also moves the command queue's read pointer
and the message queue's two pointers into BAR0 registers, and the queue
memory type is where those register reads and writes belong as well.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 47 ++++++++++++++++---------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 9250d596a3e4..f4545e3b52b3 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -239,11 +239,16 @@ unsafe impl FromBytes for GspMem {}
 ///   pointer and the GSP read pointer. This region is returned by [`Self::driver_write_area`].
 /// * The driver owns (i.e. can read from) the part of the GSP message queue between the CPU read
 ///   pointer and the GSP write pointer. This region is returned by [`Self::driver_read_area`].
-struct DmaGspMem<'a>(Coherent<'a, GspMem>);
+struct DmaGspMem<'a> {
+    /// The queues, mapped for the GSP.
+    mem: Coherent<'a, GspMem>,
+    /// MMIO mapping of PCI BAR0, for the doorbell register.
+    bar: Bar0<'a>,
+}
 
 impl<'a> DmaGspMem<'a> {
     /// Allocate a new instance and map it for `dev`.
-    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+    fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
         const MSGQ_SIZE: u32 = num::usize_into_u32::<{ size_of::<Msgq>() }>();
         const RX_HDR_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, rx) }>();
 
@@ -254,7 +259,7 @@ fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
         let gsp_mem: Coherent<'_, _> = gsp_mem.into();
         PteArray::init(io_project!(gsp_mem, .ptes), gsp_mem.dma_address())?;
 
-        Ok(Self(gsp_mem))
+        Ok(Self { mem: gsp_mem, bar })
     }
 
     /// Returns the region of the CPU message queue that the driver is currently allowed to write
@@ -267,7 +272,7 @@ fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
         let rx = self.gsp_read_ptr();
 
         // Pointer to the first entry of the CPU message queue.
-        let data = ptr::project!(mut self.0.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
+        let data = ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
 
         let (tail_end, wrap_end) = if rx == 0 {
             // The write area is non-wrapping, and stops at the second-to-last entry of the command
@@ -329,7 +334,7 @@ fn driver_write_area_size(&self) -> usize {
         let rx = self.cpu_read_ptr();
 
         // Pointer to the first entry of the GSP message queue.
-        let data = ptr::project!(self.0.as_ptr(), .gspq.msgq.data[build: 0]);
+        let data = ptr::project!(self.mem.as_ptr(), .gspq.msgq.data[build: 0]);
 
         let (tail_end, wrap_end) = if rx <= tx {
             // Read area is non-wrapping and stops right before `tx`.
@@ -413,7 +418,7 @@ fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_write_ptr(&self) -> u32 {
-        let ptr = MsgqTxHeader::write_ptr(io_project!(self.0, .gspq.tx)) % MSGQ_NUM_PAGES;
+        let ptr = MsgqTxHeader::write_ptr(io_project!(self.mem, .gspq.tx)) % MSGQ_NUM_PAGES;
 
         // ORDERING: LOAD->LOAD ordering needed to order `gsp_write_ptr` read before data read.
         dma_mb(Read);
@@ -427,7 +432,7 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_read_ptr(&self) -> u32 {
-        let ptr = MsgqRxHeader::read_ptr(io_project!(self.0, .gspq.rx)) % MSGQ_NUM_PAGES;
+        let ptr = MsgqRxHeader::read_ptr(io_project!(self.mem, .gspq.rx)) % MSGQ_NUM_PAGES;
 
         // ORDERING: LOAD->STORE ordering needed to order `gsp_read_ptr` read before data write.
         dma_mb(Full);
@@ -441,7 +446,7 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_read_ptr(&self) -> u32 {
-        MsgqRxHeader::read_ptr(io_project!(self.0, .cpuq.rx)) % MSGQ_NUM_PAGES
+        MsgqRxHeader::read_ptr(io_project!(self.mem, .cpuq.rx)) % MSGQ_NUM_PAGES
     }
 
     // Informs the GSP that it can send `elem_count` new pages into the message queue.
@@ -449,7 +454,7 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
         // ORDERING: LOAD->STORE ordering needed to order `cpu_read_ptr` write after data read.
         dma_mb(Full);
 
-        let rx = io_project!(self.0, .cpuq.rx);
+        let rx = io_project!(self.mem, .cpuq.rx);
         let rptr = MsgqRxHeader::read_ptr(rx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
         MsgqRxHeader::set_read_ptr(rx, rptr)
     }
@@ -460,17 +465,22 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_write_ptr(&self) -> u32 {
-        MsgqTxHeader::write_ptr(io_project!(self.0, .cpuq.tx)) % MSGQ_NUM_PAGES
+        MsgqTxHeader::write_ptr(io_project!(self.mem, .cpuq.tx)) % MSGQ_NUM_PAGES
     }
 
-    // Informs the GSP that it can process `elem_count` new pages from the command queue.
+    // Publishes `elem_count` more pages of the command queue to the GSP and rings the doorbell.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
         // ORDERING: STORE->STORE ordering needed to order `cpu_write_ptr` write after data write.
         dma_mb(Write);
 
-        let tx = io_project!(self.0, .cpuq.tx);
+        let tx = io_project!(self.mem, .cpuq.tx);
         let wptr = MsgqTxHeader::write_ptr(tx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
         MsgqTxHeader::set_write_ptr(tx, wptr);
+
+        // A write to the head register interrupts the GSP. The pointer itself is in the
+        // shared-memory header, so the value written does not matter.
+        self.bar
+            .write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32));
     }
 }
 
@@ -535,13 +545,12 @@ pub(crate) fn new(
         bar: Bar0<'cmdq>,
     ) -> impl PinInit<Self, Error> + 'cmdq {
         pin_init_scope(move || {
-            let gsp_mem = DmaGspMem::new(dev)?;
+            let gsp_mem = DmaGspMem::new(dev, bar)?;
 
             Ok(try_pin_init!(Self {
-                dma_addr: gsp_mem.0.dma_address(),
+                dma_addr: gsp_mem.mem.dma_address(),
                 inner <- new_mutex!(CmdqInner {
                     dev,
-                    bar,
                     gsp_mem,
                     seq: 0,
                     poisoned: Cell::new(false),
@@ -563,11 +572,6 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
         ((sum64 >> 32) as u32) ^ (sum64 as u32)
     }
 
-    /// Notifies the GSP that we have updated the command queue pointers.
-    fn notify_gsp(bar: Bar0<'_>) {
-        bar.write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32));
-    }
-
     /// Sends `command` to the GSP and waits for the reply.
     ///
     /// Events that arrive before the reply are logged and consumed.
@@ -654,8 +658,6 @@ pub(crate) fn drain(&self) -> Result {
 struct CmdqInner<'a> {
     /// Device this command queue belongs to.
     dev: &'a device::Device,
-    /// MMIO mapping of PCI BAR0, for writing the GSP doorbell.
-    bar: Bar0<'a>,
     /// Current command sequence number.
     seq: u32,
     /// Set once a message fails framing or checksum validation. Every later receive fails, since
@@ -736,7 +738,6 @@ fn send_single_command<M>(&mut self, command: M) -> Result
         let elem_count = dst.header.element_count();
         self.seq += 1;
         self.gsp_mem.advance_cpu_write_ptr(elem_count);
-        Cmdq::notify_gsp(self.bar);
 
         Ok(())
     }
-- 
2.55.0

