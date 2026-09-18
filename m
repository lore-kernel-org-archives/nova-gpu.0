Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D2D38AC99
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693671; cv=fail; b=M2YstrUvcdgk2PNozgxO6ds9SmoDFC0tfAyQL908aFPUtlIFpUcqGIfl8MF/m6aRDvYt6z8HkVkCvb+rrnCujrm/5KBz4BDUuJ4weSUe70YQzOFy+4u/trKSge2ykKFVDQv7L3p9RZtaQtie17HR9sTjM1fuV34JwX0XqIKFypk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693671; c=relaxed/simple;
	bh=3mhwS1kp+5Uy0SnMci6St+d1HNGXpLXoQvlkP3wCk6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b0/R1ejUHSC5ccyonNe82MvVLzmNHTuVa+kNyct+1G9cS/HNTgrsN6jnCsRoWioUq8BkWgyvwqydrj/IPYp6iOQaf6izaIpL4vkPe3RZ+aDmJ+zpi9LJbCm8coqSarONUme0w/tNc0strqBRe2QhyJq7mOb8mBXp9EGkhHyim6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VVTCRTbX; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VVTCRTbX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru5WdmBC/F6hTHlY0gNGuuJKzdgbdjCl0i0vJtQk+eW0qZviydjj/tZEQ73HjQOqJS/YnXf1cvQTqlrUgYT0e/fG7QAA2xgaGarjfBS8x/FIu0pq551n7bpJmD5I7L21ecmiEM9YQ+UWMOOSrcIm24MUUkGIkyEmOaMvD+a8/UWyzQI8tcheYCu6J3YzC4fgTJeQkrGwLsm+DFPCvOl83eYqXcnwN19e+HPxVet11JbVwkCdFI1airvxhjMLO9VbjAyT6wzOX4C1DKhgY4p+4LpObChIzNkc6lDqZqUhDr/3O6y3719c+5VAKBIbzVtI5ntvb9g06mRNSYm+Osd7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OK1H0oD+DMRYCkfWjN7F1yMtyHKsvXD1OzWngSALZVw=;
 b=RPI/gUioz84btWTT8dIvSGNV69X5YnDocXLh0YZccHLcNbJz1Ow3/O8Fs0sHuVP+2sNyVsTtL8JmMWqbId8Oz+L3NzlSn//XTOIWVEydk6c+9/Y54c80wigv6xqy/rKC6hW39vopnfAnAgPgbaSw3WWG0rRK9c9Y3UZR8IviGsg86eiBaZxN+UpMwpuKYGd8kOKWVu9kICkD3NERmVPpSTRtnigsPHWgNRGDVOhv0GxJhTgHBMe9P1cgKMgdHxU252yUaJ13mNrp5CzUlH3TzgqYlXFve/r7Wblycp+nPsXgbdh9w66QumEnRkRuGRZQddFox/6y1r/oa7a1JXupnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OK1H0oD+DMRYCkfWjN7F1yMtyHKsvXD1OzWngSALZVw=;
 b=VVTCRTbX25ISacQKX7eIW5avjadPm/HiRlBpsCmeEnUibiHqMxykh+H5cA1YFH8QSYDJHFKlIfArKGjOca8MTRpX72G+p2hzjhWM0rcWYvEj5/AMZlaof3gQH6wSPui6mdoe1IKFxcdYy1ntYK3TzKAcZStpa9olXzAKWgMjcimumYRbX3BnVYyFp8O2koCrQ/oZGztxXsMItMyIKZjpCtyq45G0rRL4T7kD5ly1GlZ9lXFBJrNY6EqqKPNmg/2LI0gql94/iwkMh0Q4sf/mFcxq5Uc/gj0Z4iVNbVbVx25ukmAfDde2O1q5DZiFjBJ36n7fgPHxKCUIifwgj3+Xbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:33 +0000
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
Subject: [PATCH v3 07/33] gpu: nova-core: gsp: make command allocation generic over the header
Date: Thu, 17 Sep 2026 18:06:53 -0700
Message-ID: <20260918010719.1176945-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 97522a4d-0483-4fcb-d8ae-08df15213856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	O2Mnv0ycVeSE575DsKZQnGF0N2kKF0Jw5LqUMjPfNgy/O+M9XtlqjoV3MDsdUfPG8M3uJlhfUsaJZw3CG6LjQgr/+6DLOJ8ITL6Q026RogClmgGpp6afxNLDVXoAI80KkGPxFr5qVuJP6BPcZEY5JVRcD1T1ckMsFka987fEGVz+qtHfI//ygzbiHwYjQFYA4ArTpi/ffceJdpG+hLU393n8r0b8SSq2IEHotQcOh/J7Q/6yWOzDAAgX2N6h061mNhjtwcB/Tjpl9bhecFeXkEFGmMJlcPCeqjfcVIKpi8opXf6dUd6livQxKZWBRd9RWaxPfu5l5zU1TR+fFmNXLtSBaJ3x65M6XU3sDZbr3mPD7b9wxIz2MilT8tYEOo2hAlYddZvRkKtBVM6P6dkTmTwVzSTg+b7s9BALozVOmW9WRU9/xQmrRhgTq1dNBDjSGpEt5DtZTb2LpFN7SXAXYqTF/a/I9eAwLH1Tlz+/3IPaImbUCQ7h9NAWHdW/g4zBSE4Ofofc/rfxpbYG8Y9hd92bQT7KwzYow7ansy3o38Pbp0vESpqpXcKapks6VrChCSwIWMv/lSu1nB38C7AZRe+i9blooty9zeFXEcNckh6eNa3EhZG44jEVqYha4jENxzWsX/Eof+i/cDFKs9Shy2p469BZs8tqtRwVgTjuG6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r3INRsWmRAr2yjLMkjMIv81N14iuPDpioITGkL+/E5iCMG9yQJbiSx4/W4J2?=
 =?us-ascii?Q?fWU1+O5eGEY/n5dsuulnV2u4Oc5T9NAZ4O4TNjb3IFnPxpnZgbr1msp5aDxF?=
 =?us-ascii?Q?C03ybCbs2wlISemOz3cBxpKejleCZoEWA7PP+64f5da/tDYQwcGMxaMpSwym?=
 =?us-ascii?Q?zG/xcQxmF0CTSwXk6Ih9tDyt5+yCbaet0cHHHnSMwnTq885a2jigIsUmhn+i?=
 =?us-ascii?Q?IZ8vfA+TuubIBK1n9l6cKABUAf1749lRU3FfJkL6+3vQXKj1FX42fUfS6mKb?=
 =?us-ascii?Q?XqvavPiVf0+2VXCpFxWHnb1tWTJKWGZzhQA/umdysmxKLGupHp0VKYL1Ufhd?=
 =?us-ascii?Q?tw8i0+S8c7hu1z048E87t+YJmIrFalFnbz78THi3Ost1xRF8I6j/dFUy040f?=
 =?us-ascii?Q?gsagCzIn2L4OOJehNPmiu2Q8nGkR05+m9mJgGz2z5Y0UqQXEqyOtBcgos+Fx?=
 =?us-ascii?Q?hUdolZZbO1YkxCrTq2ydaJgy3PLMsqjNY87egqbvsK06GBrRsLOqO44JrchT?=
 =?us-ascii?Q?5HLxW4VKYp2WO55AUzgPC6MYomdtZdeFpXQFixHxJ/bK4ykYmzKLAYIXTL4J?=
 =?us-ascii?Q?GzDlJyUq20k94B1fr+azbVESpOejnLgZfuLUOcukwyUrSOqFzeqU16zKQ+3R?=
 =?us-ascii?Q?LcRM8EZDcluTh9Ebeew769n39nx7PII0Ix2mHzyQyDhcP1gRlmHmtudHk7uL?=
 =?us-ascii?Q?6YLunQLd+dHz4tiTDPVZJuw+1EcbimDnYsHgF8WxLsW256a9/NUStUwWZjzp?=
 =?us-ascii?Q?WJHCXvV0is0ebUDwWmKJ/jr1ecnGlAkZg+++bBq4MUmFY6y64q/sZVeiwhmC?=
 =?us-ascii?Q?1m9Z3orraBFU8ExU6x07IpBsP1e0E7GH8iurIQND05fs658YWzkKgx83ZYga?=
 =?us-ascii?Q?CpVcVbKZG5VZyXeHDQNjEKFmYxyJYTfiZmtqll5Mwn4DrLfuZDdFqLIIOzyM?=
 =?us-ascii?Q?mMPNzscNuSgtIf4//5LhkXo1CBYf714/C3wzjrYRceri5ybUY/a8iQ7bY9ll?=
 =?us-ascii?Q?Sf1FC0pdSWQuuemEq/sV8WIOcQWZU/Sjq8fl1yLs1lfp5TDSvlvLC/iH/DrE?=
 =?us-ascii?Q?QleRBWTvI4M6JGAg1HQGxy8RpBbChITaVMb0/LtDm/bWzplR/sc1+WStLcy2?=
 =?us-ascii?Q?ZWSyLf92FbcDDfpYdq53ZnN9NpPVtNe5TaPgfUWRiAsv3LnA0OPbDtrwULvu?=
 =?us-ascii?Q?WYLTyT66mifTZGyjMGk5bsVk32KoLUTYitmNF926D9pFDz49iNx5znQJyro2?=
 =?us-ascii?Q?R81n9YPZ9tq1ndSLUJSCYCKG3t3QxZv3rpvQHgF8h65pzMGXXF5kbRC3aBuR?=
 =?us-ascii?Q?R0qDOjpaiYxFsxPdPBjHQoaWym3PjN9nl0+wA4GJzicyXAEmNIPCT1Xvl8cE?=
 =?us-ascii?Q?uml00RClvolaJsPE3cODQf7JeHXfV/gDqvGCB3zKbeVxLZw1xCeZQN+mVK7H?=
 =?us-ascii?Q?tN0zLKXBeWICvr4NMKgLqITn/C5876dGE2AT9TCBx28qTft8wP7leuXo7GV7?=
 =?us-ascii?Q?+FCwwHyhfmRdAbm5cNT0phLVLIibges0D58rCEsKHiyDFT4axGOfZ2/P2ezr?=
 =?us-ascii?Q?tjDam6cP9tYyFmS2QeNOJcCT5Z/anZEzAuWWXkKMulhW8WktJ2t4ZPojChND?=
 =?us-ascii?Q?GsvsVwi2UicnsngLii1knPxZ/2+Qp5zbSnouFQkn3g0SCi+EWNkZ8ulC/J2u?=
 =?us-ascii?Q?jq0rUznS+qD0RAKdImsjKb1F0szY5f+G/FuQ9vU0LFNfhH2hypGusxFyjr/Z?=
 =?us-ascii?Q?2DBYXxEhKw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97522a4d-0483-4fcb-d8ae-08df15213856
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:33.5109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgxubOTiwWbaZTMNHTvrprZ14YdDrB4tujhZiMWw9QPaYuyPwKatgrqmLf7/zovLla7Kq06kzxLewCTwTD26Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The r000 firmware accepts GMC (GPU Management Controller) API commands,
which open with a different element header from RPC commands. The two
kinds of command go into the same command queue, so the wait for free
space, the maximum element size and the split of a command across the
end of the ring buffer are the same for both.

Nova-core's queue allocation named the RPC element header directly, so
there was no way to reserve queue space for a command with another
header.

Make the allocation generic over the header type, along with the handle
that it returns for the command. The one existing caller passes an RPC
element header and is unchanged.

No functional changes.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f4545e3b52b3..80e6e79c5f3c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -129,8 +129,8 @@ fn init_variable_payload(
         Ok(())
     }
 
-    /// Total size of the command (including its variable-length payload) without the
-    /// [`GspMsgElement`] header.
+    /// Total size of the command, its variable-length payload included, without the headers that
+    /// open the queue element.
     fn size(&self) -> usize {
         size_of::<Self::Command>() + self.variable_payload_len()
     }
@@ -374,14 +374,19 @@ fn driver_write_area_size(&self) -> usize {
     ///
     /// - `EMSGSIZE` if the command is larger than [`GSP_MSG_QUEUE_ELEMENT_SIZE_MAX`].
     /// - `ETIMEDOUT` if space does not become available within the timeout.
-    /// - `EIO` if the command header is not properly aligned.
-    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
-        if size_of::<GspMsgElement>() + size > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
+    /// - `EIO` if the first free slot is too short for the headers of type `H`, or misaligned for
+    ///   them.
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
@@ -393,8 +398,7 @@ fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
-        // Extract area for the `GspMsgElement`.
-        let (header, slice_1) = GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
+        let (header, slice_1) = H::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
 
         // Create the contents area.
         let (slice_1, slice_2) = if slice_1.len() > size {
@@ -486,10 +490,12 @@ fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
 
 /// A command ready to be sent on the command queue.
 ///
+/// `H` is the type of the headers that open the element, such as [`GspMsgElement`] for an RM RPC.
+///
 /// This is the type returned by [`DmaGspMem::allocate_command`].
-struct GspCommand<'a> {
+struct GspCommand<'a, H> {
     // Writable reference to the header of the command.
-    header: &'a mut GspMsgElement,
+    header: &'a mut H,
     // Writable slices to the contents of the command. The second slice is zero unless the command
     // loops over the command queue.
     contents: (&'a mut [u8], &'a mut [u8]),
-- 
2.55.0

