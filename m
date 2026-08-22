Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE6930C158
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363746; cv=fail; b=XKRHE6WU2a6Xd1jSt8GO8l3YkSemQc6krtDs8cSXTRJHIvhPWOfYhqdnSo6JTBA3w3E1kvAfAT3KCrYI8lBtmMZNmVwxcDt7jcGkW2Y/pOEacLJ3z9n2IFRM9WQ5CbU0PaoeXIqnsy126I2xXkT5Zkfk2ZujB9YaDpnmTcwrZkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363746; c=relaxed/simple;
	bh=gAJ6LfBv2g3u5DOge4jxVp8tR5NLrlt4lfjBybeP5CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CNmW5O5klVqCZGKa6DhLqTgSnlE5p2fkNHzU+pWvsK7iu5Pm0BRwwKxFH18lcBgYTu7hXWUyuderwSZX/YZtd3ZhtQ0rrT3QtZzTvZ35tLj/WGLmMhwDtdlNtetbr/2yO6BV7b+PJVHBi7mE5eWSUlNmoSJLNuvgJUkJr0H+Shs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N3Nn00E3; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N3Nn00E3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfhQ4zqS9w/llPeybIMexzsHYkHGZHIWHmXA5vuIGCBAhiYkkBQo6pixv4NzoDkeB3x2gIZN4OJpuHNMBZVmk3Cf0XquB6zT5usYarDhDRy5wdKh/Yfs8uZ7RKkgOzjEf3rD7pMtZNyaTjGFwvePYbxZDYKpswr+d1sKnXFVAuOSyhLLcxRSt0OaEQ2mVLqaz/V8+ZACeTfsndEMxmhZpSZdULrvprnHu7U5DoYHmWR7lU8DdT7Vx1+Gm/BP9hGujN8V040dFDPYUx1GoCLkmiX7GLIJi+oDHLlUbyZVRiEfacT7le5i++PWLLiE4/duOcHsSboyU+ZY4A6tJdL/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hChmwU/McZ0y5g/4it3ohshhi3uK1EDAAT4XJlBgdMg=;
 b=S4UsUlNeU8C7TrIxUyo73X/LdTBL25AQsr4/Ejnkr4aHzZlEQ5RNad7uvW6ftLBkMVwurSsPCkc3kakeZirs9oW/q3L/k2suOj9qwQS/ai98SGboy8AX7E78cmM5fsCQTB277aAz6ReMWGZkjj4HM5tp89T30CAbucmZu3euPa4VEIcnI8vkusMyLdZ09ZLte0YqPgehFthJogsGErFdboI7t9dc6s5ceE4v9/d0QXqupfhWa7l4L2tIfQXxhvr/d67/Fhl3+gnzqrKztyw1nemnIr33TqE6GzdrmwRfBg3I2ioT/mapEHQjHhOVcL45DvelYTaaO8zcpyL81xoD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hChmwU/McZ0y5g/4it3ohshhi3uK1EDAAT4XJlBgdMg=;
 b=N3Nn00E3LoZuV4BROlxygk4scQmBbguQwsduIaZLA0rI76ooAL3BLxu5AzEH7W49AfkGrOPC6+cSAM7FJ9qvOgOL8lfos6lh/1QKFBL6qTwWFhBQPNe3b2auA2Kws5qbhtg3UeePk0J8RjyX3aPfrK9Q2JOvXzPjKDTFjozllEJ6Yvdxg6iNjE7d/KvVhwHzOIODDSaQtbGmTLMN/umUiJf2I/e/DBEvX+BDPkTlSy93LlUELbCxWZgan/tbuQsMyWWKSUKSJl6GfmtEtejcxO4eG2nYasJ4sfFJjrvdw25D7pti78Zm2juETG6ngWIOWYQjpBWtyDaoBO+tjhQIPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:36 +0000
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
Subject: [PATCH v2 14/31] gpu: nova-core: generalize allocate_command() for variable headers
Date: Fri, 21 Aug 2026 18:54:31 -0700
Message-ID: <20260822015448.238214-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 29adf0ac-e832-481f-d766-08defff075d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	jfldsxu5d9fpUL88cAmleelfQvQVvnANyR7ylofvgX5z+UrYV/uvJptu6AQ04od5DQLIqEEaw27kbXGbpGoo+8MNcGFE787Uuz1bwm9j01DMORyXOAhjwUJhpt2ncB8W0RUZVv4ZKqXYtKSfCoNSp0vSj4Hd+VGXH8/7orbV2iJ6P1NwbKNxtKT8+G5ijS7PBUiA3b+uujLzsltqfkr+B5115HmMtKbnjDxg5T5apUlZLH0W06EApNZi7i+6ghCejQOexkkWaD5O7Yl98b/+pUbes3liqDTDfR87bEov1D10ItugN7redmQLSQnxioZScT6FoHzKyD+aF9L7wsXo7BEl83JiFg4b+msqEy0U3LXzr74HYkcpkuhkeb7H+MC3yGNcFpr4FraYhVF+BNIdpDSjoKm2WAyX09zS6MFETL7tpjjCmgYCa5VJHa8+kV7zrxrpwo170VOT4gG9tGPpvq4P15q6DIu9ce9FeNdX85nWWhdlqyRPvmL9/kN9RR0+TENFBOTSuWsnN3QIVwPMIDaFlTKXIjGdV2w1/78bVL8vfzCCejexOWgiP8PYSD2g34qr/0N/cQN0qwBb10HCYqzd0DtHPzG0WAznMiWqnWJsCtZlKRUsZv5TPdSzLO5wLsp+ZoT/1eZq+gevdtsfZyDWIVC+Fa/ZAURJlmoXtME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xM8Cev9Suqutjn3MIuv+557NuMfVa83jUSJ0pat9+4ZD2KYErjp01gIgWbX2?=
 =?us-ascii?Q?YaYc0FMPsTadjqMQRILTkVMr61yKdYIxfwzoUszMz1NG7Iwdvt8xEBaEPA2n?=
 =?us-ascii?Q?63xQSh+2FHlQ96CvzoaCaRFPdj5Mi8FfasxJ2KHICh7S+K0OTCSwxj7JoaKN?=
 =?us-ascii?Q?OCw8Tvxu04Umg6KD8hmY6JzNYgcja0qpDn1nq7LGBDVe0pdFmY4D1XSR6ObG?=
 =?us-ascii?Q?+7HAZ5HHjL8q9KVV+ctoQJ9ncHIHoImX8QmRcgwQx0YBK6yR+1ofLYyAl3fm?=
 =?us-ascii?Q?Dm6qzmCuTmWtZp+Wjmr+Iv14iFwYQhQYUPIhx4MoREtlE2q4GMxLDh7nMzi1?=
 =?us-ascii?Q?qnuuJ6LUlEBAs2atjHEtOB/QGTTouZn5XAruIAE26sPZeP6n8mbcEuKySLcb?=
 =?us-ascii?Q?5/UIBHZIQADOKGNYuYIxzO3VgFa+JSJi6ygFsc1SIJw6tbH76y00Ddx2Ded4?=
 =?us-ascii?Q?tQF+APqvv3YOD9EwCz8482iM9MCBc48UEWRWvazEwVWuR3e6Nl6oOBP9eW34?=
 =?us-ascii?Q?zoB05A8Vk15zXLniF+m1NXDS7PkorV3v0/NIWWKAT4UIO+DAFH0dj0r4JBOw?=
 =?us-ascii?Q?wrzBNWhFJtgmYQTrI/iDQVpqRn2WM3IGbPqsSdzcL9tGl++PObQNEzSorEfw?=
 =?us-ascii?Q?iAgN6K0Jk0jXP99ESQ2bHkNXWb77WsHfOVW7YLPI3o9Aeseet7sGfKU3MoDV?=
 =?us-ascii?Q?rp1BwkL6ei61dFCO7FVJuue3uZghU6OZIXy18WeJBWquwnYqfaYeEb7oQ3US?=
 =?us-ascii?Q?TWcg5Joz0smU1B+j/7eh+0uVmodtookgbL6MHGFf+OGCurSAA7Yhb8QPKoqv?=
 =?us-ascii?Q?TH1tWAiyy0xJl/HjonnIQWo7lniCdyRDvy+qMWUKp74/T74iAhGzzDwC+hil?=
 =?us-ascii?Q?hTxg+IRsl8A9vqJPaFJqbKcST/ZFiWY8pIPkgNiYX0xjTWAUdyPq0YbFXAZH?=
 =?us-ascii?Q?mVcRvLLSeCGJCeHHDhAVPfvHR4KAkqdSZRgfwGJ85lbU9UbTCyV14/49e8uI?=
 =?us-ascii?Q?h9tu9UHX6UJJHRo7CvmahyfTpOCIQ5Xz3Iz0a7PKzdMCO96N6VsHf1GwnwTi?=
 =?us-ascii?Q?Dwa2ICzGoujZmGB3zXR1yC79pPT7QpjbwZx71WLWATe2DA0YVGobKvR+Pukr?=
 =?us-ascii?Q?xmjdwbcgBhTIURv7NM418zJ8z7sqTNo0xgxeD92y3nUpIZUiEfk9nRy9aC8v?=
 =?us-ascii?Q?7Vb8N8uV8l4+YfaKEPpcQ0I6i7fnxDT6t902F5cYW993pz0Qnw74DbnQxiIZ?=
 =?us-ascii?Q?M3YPoizDGKhRzX/Z92kBvACsPBkzeb2iAFrsVT+jVGELu0YdPxzShdeXbcyh?=
 =?us-ascii?Q?A70Yi8O/UNPS5YhLCwq1g7GXfM6VQhJBRjFeS05fTowyt3p4zHP4RoMR/M9v?=
 =?us-ascii?Q?NHOyHgWQWoBHUc9wCfCY/jAoeHEtnpvIr6iP7ZTggleKw0sVyrSVyOaUFP2Z?=
 =?us-ascii?Q?dZp3knfj6RBLX9KnGQZm6vWPzy5QXmmSmqMpjZdqJd7CO+Kt5L96RyT4lEKI?=
 =?us-ascii?Q?vVrmJw7EZlSlz08zOg2r8iQHuKW05TfBb6lwv+z8zRMu6GhRPYoj2eXcD+v8?=
 =?us-ascii?Q?i6qY3330Pb2uhThlfU9U7HiWCKZ8A3wbBcUxa8aD5Li7mlPphDKac0Ib+VSg?=
 =?us-ascii?Q?Ij+Q2svwjjVCV+gnS8TfFVDfi9DzYFJI1wRh+SlWHSOzY1ACa8NFazEWCicX?=
 =?us-ascii?Q?fs/sSN3aDHbInrS4Qgc/z3ZoRv9/a/9xbYHgJqcx8u1YG2mELA7LwIxsMmcr?=
 =?us-ascii?Q?C6eoyAmyCg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29adf0ac-e832-481f-d766-08defff075d4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:36.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTrLan5FyASFYrvRBi4kyWoNBHkxJfekODg6vWnLZPJqOg42NZHumMwyeviyxmxOUN7dRaKNtsZqE6F+L4Yy/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

The GMC command path uses a different message element header from the
VGPU-style RPC path, but the two share the queue, the space accounting,
and the wrapping rules. Make allocate_command() and GspCommand generic
over the header type, defaulting to GspMsgElement so the existing RPC
callers are unchanged.

No functional changes.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index a46d8927da1b..babec37716b5 100644
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

