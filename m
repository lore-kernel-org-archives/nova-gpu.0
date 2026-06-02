Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011033.outbound.protection.outlook.com [40.93.194.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A4C356768
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370510; cv=fail; b=srt1iOcMWOm553F2lB3EL6sZOs4qsBKhBVtSUfU3oqiFiuxWGKSfxIHjKKR5ZbKWkVmecOk8MP0PbD2a5OALPVKhu9TlxagRKbZ/rTm4RLxRi1CrU4tX0WtTEBfdqxpyrdf5b5s1UhZ7nBwMOHftSuPiK80DrXqq8nNWayuirlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370510; c=relaxed/simple;
	bh=aQlh/bnVnLyTYmjMFXCp3nFYngSl3BR7N8xbrSHAoGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i+RtSQpSSH/jbrCCQbrYjY0NZx09FAmeLIrF9obdxJ/ZRLdmlt0/1TnTDSJUtYHvURjIwcuw0HVomeaACKQdr/Ai7G/SUQGhOVhKSa4tBWHUDP1oG/46ndYbQoApas5E9E+UEu5EzoJ7qjx3kllBsp5IFMB71Lodlo/PXK9pLzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=apXZ29Wg; arc=fail smtp.client-ip=40.93.194.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="apXZ29Wg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODv/dFt5PVdHKF+poxjam6h4/NspmG4Wuyl1Ioz0fUNbeLtAZad+N3eK7XR4To5K4oy1be7e0QvluwFCz12lkpzLtRRE0625Rulmvpkvu1ocodm5JpbgfblQxzVQRnwVAu4CQx+BMEmjOzpnw6LnwShEY1EULQAtNb6547C1AL0/nE15cQjOZEujsHUocR9ppjHMx36tOYcX4psJMStvMpcOWnAZm8yUoRAMyMNELsuH5GpjxAi/pBLEs6l9v+BKUoByL1I7MJYRCZZ3ihGMQJrzP8XZAk5RK44IRTZnzHfPetkJn/QWjigKTs/Pr/1J2ELBRxyb0ONp7PVMaSqS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oxb624QV1ilH1UXIACA2sX5+KaAd6cLuknnnqF09egA=;
 b=y4BCqfwhJNeV9hw+5OzbHYKWgi1n6yyfzXpxard8o99buTeZWjlQS5VEHBSKvK2W46sKwNB4qlxIBmiwO8cewVRLrrzCJbq54raTHiqERajjPR8vb2AJQcjZI/ecCkYe6kr8+u1sQyw8mlCmtC6Sj6GRFl/q+OoW7ypTl+M8u/6/CLRzYYNU/SO8HXXhzDgj2tJvWMOutSU4F+6u9qlPhv4433Z7BH2vgi+cqvg9cXgMH7FwE01400Lx0aS0zwfu+GWSsIjhmFLEK1WgTwwv9lLxqRid0UygeYZZ4GpLmGEq+bmWjIjXwhRVtAHXoNdZU1bGEuJ6iJzBBikTkee1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxb624QV1ilH1UXIACA2sX5+KaAd6cLuknnnqF09egA=;
 b=apXZ29Wg0VJ5H1pQh5g8MOt83r35MNtS1ctyLrKtCYzcrw7lvMvk/TDCbbH516Xa5FpoIYCkrBofQkDWPtdyW3PRk/qcWsj5k13ZmKQYx/elPMZbcib6c0GifpHJXO/qVq/TZrt7xdEWo3w1767KAos7eAZ0/zO7lZQQeU0GvQNzEplYYrjVJmTHOxvud/0FHe86V/EKb2lCvWf7/LHcdqV0CAeasjMWu1YcbhPyZ0M8uGbllmFnOvoXxytbFhAcXQ2TeDqRCU1Z962t3StoJkKwgUIIeBe/sNJKnzf8o17ViVo7RUNM18DIcrDdQS4b4FEnZjiGfeTW50i9iBL9Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:35 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH v12 17/22] gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
Date: Mon,  1 Jun 2026 20:21:05 -0700
Message-ID: <20260602032111.224790-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e08ed11-2382-434d-03d2-08dec0560d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|56012099006|18002099003|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qHow6COINwB7yA/4GxXcbwivGo6hG8mgt8lreQ+Fz5f7CJDp7paOKUQhhigCW2ecc5YCjESQqgQ0R7HbvBnV9z/Wh5vPePfoLkOEeN8WDiwh7zuP4TY0IOpUH9NWDWQUQRYYucADciRRHTUsymhK/VxRRVeGzdKdrUBvqVogJR5kRQUFKCK8cr5DvTgCISIWilpU3czNiHzxtL0KKiSnH/J2edY65mnrkc/CWtntj26U/yR6O2GzBsN7aKH/Lk2pHLSoJfBTuqQ/amysXhW8vzbdsObQX0j7hqfaM8ow8Q/is5cmCVQ2ru4gNZ/hF6tgnsAwNz5tA+GzhRKKnZAm/yZ8P2i+XpFkMQJR2WNpV4/yQd46eSiv4NjE2EbuhTcWHyec07NGxWYayclU5NVfpn1s3Cz2Y+W0Gh26fvpy0KEFDUxYsn5st4sDLViQoiA0lhNDcqZOWiO/WD600raVsdwJn+2j87qJSVBTzsvKMTYwki5UHQeHIOFTSISTex9guWj3pu8QEi5bYcSHoa3VluZSsxaYJTgFriHfkQVpIS0HTqRXmoeH/FZGnzQW5w0Gllg7pwZyRAkYgNuM3Tnt7H2nLn3hA5rg7xS23GjrsWxzHI+vCjRChRDh+Qi0OZes4PCbFzf7yA2JN+VxjJ24r7wZsYetXEOJRRv3aiTcAnqeAUCQ7ni+oyvNMuI4qHQL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(56012099006)(18002099003)(11063799006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BOl9hnBle1KIZkEBDUEV55ZJsliNz327T0GMic54k7laI9iAdLVhkbLcQaJG?=
 =?us-ascii?Q?kD9LxeNLKulqm66DCyreEAEKaRgRGIsq+lAHuM3dsexZA0sGexIhy6I5km4B?=
 =?us-ascii?Q?eOu/g5AyA3V4Y+Ox2as9rLH5ujMgqqSv1X9/w46SziX1dKU0/5SaooyH81Lk?=
 =?us-ascii?Q?Hr2Bc9SnolbfmoCnVixqS1m/MBjD3x3TUhXjJMosruJP5rU8h0QAPLersWpz?=
 =?us-ascii?Q?64rfEIlLC7I0iDYrSM78OxwRHjFOY++OE8fpV/sYm89yKMolOYVgm9HurHyH?=
 =?us-ascii?Q?/vic7wgKGKP4TS91z1uukkCZtdnHKBkcGZABUfKZ3IGCDasm3TEL73hz2tJR?=
 =?us-ascii?Q?5zaelA9MOfrtcmnbLXZ9OjRkVf9Rr2Wg4bhHCUcv9DeT9647Lwa9+8+4lWlJ?=
 =?us-ascii?Q?zseSIZjsDmrff3Ym0Kb3ddOOCSctna1Kwvbg+PirffDOIU2TCPm7uklEhahE?=
 =?us-ascii?Q?wxFEYQphye709/FMR69+SBte6zc5dwgW5pNq4xBzwvbpTJtQOYGc1IlLMMTW?=
 =?us-ascii?Q?CntPqAGYydtBtKiFFXyM1aWSFqfjt0WNyVzPMzUfPkdlMYVILB/gS0KzDSwb?=
 =?us-ascii?Q?uc/BWEDye4WMdDjmg1mdgcggRNPhrNr69/lc+85FWqZXagW1z26I4NHZ/Stt?=
 =?us-ascii?Q?k4mzJjTdFwhQ3WGYDXvtOXKnt8/n2Xffx6aZaAhAMlbFdgjx+EA09iXAiPhq?=
 =?us-ascii?Q?hZx5d3LHwpuySYTGqDQ7T3+t/bcFCMS+rYK37UNeAClhHU7NN2jlqdtBBJaC?=
 =?us-ascii?Q?66geYU2qL5itTtrqExxQSXXSRBzld20KOgvV3iBurK9XUEtJKpQZ1Eicyw3U?=
 =?us-ascii?Q?WnuQ3COwRp+I4v3hSTN91MV8j49cDSM1qyXab4exyRMsvC+7x4zjCG6ZX/M3?=
 =?us-ascii?Q?QwihtsNe3xZDBBS+qzE8QdR0qjHmzG+9e94p1b1j0QzWeRlMubOhRkwO4hJo?=
 =?us-ascii?Q?NwOh8WlLksTkgHU/TT+BMeGdLigunf3YNN4RMkWTIcBjUGFsJV3mvkIaFvyN?=
 =?us-ascii?Q?eI4Vam+/xC1xeOaS2RXtwV6o0c7hrrjWKgrgDMWK7sq2lL4PDrTVFUZJUVhr?=
 =?us-ascii?Q?lMjdVAINF+eaP0lqMh+0cwbWmMo2P7svT6ng928aD1GbmUT0xAfSH6en1/RJ?=
 =?us-ascii?Q?PezKOGiu032seMNiKd8dR3B2rOaMoH8ZysJjoktR7XIwVvafe1vwf+UD9i40?=
 =?us-ascii?Q?LrJ7rFn/6r4i3qvE+nmV6Kld+y72GNRb+Nd/zmwJaUGfajyHZ4DEORyY8v+R?=
 =?us-ascii?Q?STnhoBGFrMPM+WE1olr5MgTCTuEpK2vieT96mNK6Q2SreK07c0fXzArr3BwV?=
 =?us-ascii?Q?sfPrLoKEjd6DNxdQMRug1iEtl2/dr/kRhTEwu++Gs2+cZDzLDiBSA6fcEj59?=
 =?us-ascii?Q?sFG3i1Vkrnwj+sUOC8nyefvAghn/N3t1Z/xBzgohD8ZFwsbHADUGfpy/u7GG?=
 =?us-ascii?Q?WdEQ99FXruDTjHLKv+2cVXY/Hn2ArSC4BEmbpYo8BTHJ3UBrUg0C2v7vjGAo?=
 =?us-ascii?Q?lydF65UN9V/cnxqHAtLEwffzDjKRgYw1gh2M/rWYeVQ6TpN6bM264kP96LoE?=
 =?us-ascii?Q?A1l/rL5hcZdFOJo3M/xB1PEihOLanMWHXIbeAYRe6bUuKbzikqJ5cRwpLjPO?=
 =?us-ascii?Q?qPRmZVruNwSS+3gZ72RK0qAcC4LgtHPFSX+OBQOrs1AooIylUGztXd0Vyo3W?=
 =?us-ascii?Q?xiGNtPj5h5Z3dADjN+1teIpnOtigKb7HDPi/fCge/mtijeG20n/uUkid8eh/?=
 =?us-ascii?Q?sVyZcXtWFw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e08ed11-2382-434d-03d2-08dec0560d1b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:35.4305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gF0zZSCWjpeeFJgeJ3+hdSHpNMZ2HgofUmST+waiQOX/L8d9krUIOuMRuLWC63VcI41Xlcovd4pknSXHl01WPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

FSP exchanges are request/response: the driver sends an MCTP/NVDM
message and must match the reply against the request before acting on
it. Add the synchronous send-and-wait path that validates the response
transport and message headers and confirms the reply corresponds to the
request that was sent.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs |   3 -
 drivers/gpu/nova-core/fsp.rs        | 121 +++++++++++++++++++++++++++-
 2 files changed, 119 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 0ec1c55213bc..3df1cb2385cb 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -150,7 +150,6 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
     ///
     /// The FSP message queue is not circular. Pointers are reset to 0 after each
     /// message exchange, so `tail >= head` is always true when data is present.
-    #[expect(dead_code)]
     pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
         let head = bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
         let tail = bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
@@ -166,7 +165,6 @@ pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
     /// Writes `packet` to FSP EMEM and updates the queue pointers to notify FSP.
     ///
     /// Returns `EINVAL` if `packet` is empty or its length is not 4-byte aligned.
-    #[expect(dead_code)]
     pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -187,7 +185,6 @@ pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// `size` comes from `poll_msgq`. Returns `EINVAL` if `size` is 0, exceeds
     /// `buffer`, or is not 4-byte aligned.
-    #[expect(dead_code)]
     pub(crate) fn recv_msg(&mut self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result {
         if size == 0 || size > buffer.len() {
             return Err(EINVAL);
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index f3524137d9f7..67cf83aba83c 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -11,7 +11,11 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
-    time::Delta, //
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
@@ -22,18 +26,56 @@
     },
     firmware::fsp::FspFirmware,
     gpu::Chipset,
+    mctp::{
+        MctpHeader,
+        NvdmHeader,
+        NvdmType, //
+    },
+    num,
     regs, //
 };
 
 mod hal;
 
+/// FSP message timeout in milliseconds.
+const FSP_MSG_TIMEOUT_MS: i64 = 2000;
+
+/// FSP command response payload (`NVDM_PAYLOAD_COMMAND_RESPONSE`).
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCommandResponse {
+    task_id: u32,
+    command_nvdm_type: u32,
+    error_code: u32,
+}
+
+/// Complete FSP response structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspResponse {
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
+    response: NvdmPayloadCommandResponse,
+}
+
+// SAFETY: FspResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponse {}
+
+/// Trait implemented by types representing a message to send to FSP.
+///
+/// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
+/// a given message, following the same pattern as GSP's `CommandToGsp`.
+pub(crate) trait MessageToFsp: AsBytes {
+    /// NVDM type identifying this message to FSP.
+    const NVDM_TYPE: u32;
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 ///
 /// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only returns once FSP secure boot
 /// has completed. It owns the FSP falcon and the FMC firmware, which are used for the subsequent
 /// Chain of Trust boot.
 pub(crate) struct Fsp {
-    #[expect(dead_code)]
     falcon: Falcon<FspEngine>,
     #[expect(dead_code)]
     fsp_fw: FspFirmware,
@@ -70,4 +112,79 @@ pub(crate) fn wait_secure_boot(
 
         Ok(Fsp { falcon, fsp_fw })
     }
+
+    /// Sends a message to FSP and waits for the response.
+    #[expect(dead_code)]
+    fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: &Bar0, msg: &M) -> Result
+    where
+        M: MessageToFsp,
+    {
+        self.falcon.send_msg(bar, msg.as_bytes())?;
+
+        let packet_size = read_poll_timeout(
+            || Ok(self.falcon.poll_msgq(bar)),
+            |&size| size > 0,
+            Delta::from_millis(10),
+            Delta::from_millis(FSP_MSG_TIMEOUT_MS),
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP response timeout\n");
+            ETIMEDOUT
+        })?;
+
+        let packet_size = num::u32_as_usize(packet_size);
+        let mut response_buf = KVec::<u8>::new();
+        response_buf.resize(packet_size, 0, GFP_KERNEL)?;
+        self.falcon.recv_msg(bar, &mut response_buf, packet_size)?;
+
+        let (response, _) = FspResponse::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
+            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+            EIO
+        })?;
+
+        let mctp_header = response.mctp_header;
+        let nvdm_header = response.nvdm_header;
+        let command_nvdm_type = response.response.command_nvdm_type;
+        let error_code = response.response.error_code;
+
+        if !mctp_header.is_single_packet() {
+            dev_err!(
+                dev,
+                "Unexpected MCTP header in FSP reply: {:x?}\n",
+                mctp_header,
+            );
+            return Err(EIO);
+        }
+
+        if !nvdm_header.validate(NvdmType::FspResponse) {
+            dev_err!(
+                dev,
+                "Unexpected NVDM header in FSP reply: {:x?}\n",
+                nvdm_header,
+            );
+            return Err(EIO);
+        }
+
+        if command_nvdm_type != M::NVDM_TYPE {
+            dev_err!(
+                dev,
+                "Expected NVDM type {:#x} in reply, got {:#x}\n",
+                M::NVDM_TYPE,
+                command_nvdm_type
+            );
+            return Err(EIO);
+        }
+
+        if error_code != 0 {
+            dev_err!(
+                dev,
+                "NVDM command {:#x} failed with error {:#x}\n",
+                M::NVDM_TYPE,
+                error_code
+            );
+            return Err(EIO);
+        }
+
+        Ok(())
+    }
 }
-- 
2.54.0

