Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012004.outbound.protection.outlook.com [40.93.195.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA3471265
	for <nova-gpu@lists.linux.dev>; Wed, 22 Jul 2026 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706013; cv=fail; b=PbM1f7hNHhKFSJ1Rg6Ko3//IOcHOmPWhPWzFOt4Pijy5Sl0DyCZVHxyFgCut3xYo+Bb3zY3KX/MBfLVrNdJmKb89g0niz3yuZFYEZawOlFMvEyzCB3NQTa8cmBTUmQuXlvDkUMZgfhhL9HLO+n7sC+mkhGSMmY0HYVwMNfTivLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706013; c=relaxed/simple;
	bh=nejxH+98rRQ7HkcnlxUV5lVuYFfeY1fpgbC0mMbGIEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X8CzJ3Cd2oVI6HInTxogT8qVJQ3X0Fd7PbyBsLrkLm48iXipMOe5aXt6foFOEOeLCzd2ehZyfowj5DprMiUaYlY0ppETK4/RDWDqIC7tAsungPPuqHKH2uVJQGElVIzpaJcXOwOUZzS/9p70kAO6ldruCH763Z01/6Ex3dZzXxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L2wTbAJC; arc=fail smtp.client-ip=40.93.195.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L2wTbAJC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqbzQQDuf3QjzlLxmfOj5Qkz3hThQGEYqDQ3ZPR9b7WrkSihoqt5k77D9PXqDTRBskZdMzUgefS2jiJWvjOi2U9+UNcEVrbCyfl18j+2+1s13B6+leCDV8zgbjeqoAeh3RGFaFnHZVAK2DELfzy4tWphg1A7Mu6q1NjqJ7SMdtiNppP3+cVNevD9k4uUe6cLalCZGfX6LBrWuUKdRg3vBhK0/IVgUaaL9VINViOqz+tIZ/mIoc4SWeATrJ+Hl6RRYYYPPl9iRrMjXmLT1pwv+AZeDjv3+bEEuCwGpc/yi4k03QYFeFe/mVI1ZowPrd72ym72nPRomwfDRYV/XdK7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VXVNvZidTR5SAqvjoXAFOaoGThKeCvB0fPUObuPF7s=;
 b=BOKuqJHVFpu10H3jq9CU2MDP34hzjQ+zBMdy2VMWiiWdHuTXi5/ijzWh7lLf/O8tttYWvT0UfdYH9V3hVihAir+FbOTtHx4Up6txoYuhPA7SFkAlYryjyLZP2bY1lYw4ELsz5WpDD0rALUPuMjIdj4whiLo/Ak8nGsqWKSDIPg/Fb50Go3trzSEyr6DW1kP430FO84EYNZXWi4qHGD+a3BjNsI/9CP1lTnHew44UQiaBY3xalZ+OaYEteUV7IxIPQNXLUM9L7uDLcbeFdoxdt0a1xxXYcm3831pRhAeiLSF9Prj0wvb+KicSoTs//EKm56wCGAdBNLnXP7Yv793ZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VXVNvZidTR5SAqvjoXAFOaoGThKeCvB0fPUObuPF7s=;
 b=L2wTbAJCGg2BS536xKy+dvR//BKZp6T6Mt9mLQg4D76scwyVxlz8Z8j8X7KhlqEej6275O9UOata1Y/kD0njDF/k3mepqfmoIlhoBknGjbuMXJiZm1pFTJtie2F0ZOccs6nAF66ilLWbuY9pb32DikknEwKZnf0YTHFVm+7NBTI1mQHw/bgO7B0UKJTdTGc8TJcV3S79QpucNxkiQGkc6EYPm5Rx2rXS2cuY6Xhe0Oh933iQQMx1JU6aANrjrxB8qUTWK+MySEv+JFrYqn3Twlee0fLtToFVdaCnYw6SKo0SWBP2YUYHumSHn7i3tusrjA6uRlV75iuLHIitUVMaqA==
Received: from SJ0PR05CA0171.namprd05.prod.outlook.com (2603:10b6:a03:339::26)
 by IA0PR12MB7752.namprd12.prod.outlook.com (2603:10b6:208:442::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 07:40:03 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::87) by SJ0PR05CA0171.outlook.office365.com
 (2603:10b6:a03:339::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 07:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 07:40:02 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 00:39:48 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 00:39:48 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 22
 Jul 2026 00:39:42 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v5 3/6] gpu: nova-core: read vGPU mode from FSP via PRC protocol
Date: Wed, 22 Jul 2026 10:39:10 +0300
Message-ID: <20260722073913.1807677-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722073913.1807677-1-zhiw@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|IA0PR12MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 333a6b99-d61c-411b-44d5-08dee7c470d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|82310400026|1800799024|36860700016|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	B0LjDxQhHPEZfFyrJ9+HfzwbMvQnB88UW/nJfUeypQBGB3Qpmarml3Fog8BYmCfJcQI7byI9mT78NioYgQV7ddVLfw8yjaM8vGovHcCF7gSThoGHU6RdhP1caGtfVbUI3kcu9gTtj55pYp+KVRbg5GGNgw3JbIo/D17EfsuZJqq9ctThGwtVfBC2fkBwTXPXGYetRIbI1k9bPiOf2rngWWaZgHcMh9+UF6bJ4DcvClv39hiZyOBMG9TsT/3hT5mYt3Ly1JNGzGDx+MpIzxyS7KIIlD6q5lTFTIT0cC+QKkrcuCwrNf18Wu82CG8fNUSudzjFwzAF8nOw6klmvE6zSXr8snJN/pDmi74NwfQb0Q2LMnL2NHr6GLnvFg5c0MqqgXMCCpG/yerKkkAw4OzdkowuTZrTsJqwQhoXarFIXxUiFSGVO/ulzW2OCRxpoE/w/5V4GpUe3ZjVz84e1viS0PU2j8yv7VkVLwqWt9za0PKBWdreun74nqeIHMc7q+kytle7JEiCAdjc5hcwa3cEZBlxSv2YMwVmc3HrKgLA9JmmdV7yQQmr25xzhFbA8cMez8NCq0fhZ61rveeZgQVEKlAoi3S6OT6ntIOcsFdVPJpOAvVTEcp+wQsRI2G68n+oBE1SJXM60vvvwEXSGVH3zjWILzhOisxdllTY1k+CmKKP232fG2thEyThn0HG9e65lerMctbBnNXjpUw7tq0cyQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+QGe8Pj9UsIubKMgQdz4DBZ/ogv1JJ284j6a45JnfzWwNRLeM1W07GTb7Y7OHZm1oDgk4MpKAMdlL8bg2S6RkoOf+jMafr/x0slcZOePnnOlTD6RlxE4jfAXNHLfH0L2qzfHVvuBPv4qf6tA7Q3dvgsMwu9aUqPn9YjW2MUYm5Bb9/CfMs6+7H5Ay+sgyyd0CgztrLXQFtimA9ZtS/dr2eH6eoIOx0X+Jd1U/2LhUyDSnWGQnagOrZG8e0OPXq2FU40dIcckM1+8FM86g+dOoNbfz8syFfIRouIYcpp/JWbwBiwlditwOSm2Jm7fZyHtWRITMuA46lHbWz3dqzulvsI/0TlmNaLmrwPQ19909DzS/JL5zaoQci802ZFqraKFCzPSd7vBjkquAPHW5+SnxI25iZXbA6O8TRvqmZDFMaafU+jq5MmZzyyQnGwuCTnW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 07:40:02.5354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 333a6b99-d61c-411b-44d5-08dee7c470d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7752

vGPU boot needs to know whether firmware reports vGPU mode as active.

FSP's Management Partition exposes PRC (Product Reconfiguration Control)
as an API for reading device configuration knobs without firmware
updates. The vGPU mode knob is one such configuration value.

Add typed PRC request and response payloads for the vGPU mode object,
add the PRC NVDM type, and parse the returned knob value into VgpuMode.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs  | 173 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mctp.rs |   2 +
 2 files changed, 175 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index afbd75879d16..3a6b02f0dc11 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -52,6 +52,56 @@
 
 mod hal;
 
+/// PRC message sub-command.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+enum PrcMessageSubcmd {
+    /// Read a PRC knob value.
+    Read = 0x0c,
+}
+
+impl From<PrcMessageSubcmd> for u8 {
+    fn from(value: PrcMessageSubcmd) -> Self {
+        value as u8
+    }
+}
+
+/// PRC object identifier.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+enum PrcObjectId {
+    /// vGPU mode configuration knob.
+    VgpuMode = 0x29,
+}
+
+impl From<PrcObjectId> for u8 {
+    fn from(value: PrcObjectId) -> Self {
+        value as u8
+    }
+}
+
+kernel::impl_flags!(
+    /// PRC request flags.
+    #[derive(Clone, Copy, Default, PartialEq, Eq)]
+    struct PrcFlags(u8);
+
+    /// Individual PRC request flag.
+    #[derive(Clone, Copy, PartialEq, Eq)]
+    enum PrcFlag {
+        /// Request the active knob value for the current boot.
+        Active = 1 << 1,
+    }
+);
+
+/// vGPU operating mode as reported by FSP via the PRC protocol.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum VgpuMode {
+    /// vGPU support is disabled on this GPU.
+    Disabled,
+    /// vGPU support is enabled on this GPU.
+    Enabled,
+}
+
 /// FSP command response payload (`NVDM_PAYLOAD_COMMAND_RESPONSE`).
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -61,6 +111,62 @@ struct NvdmPayloadCommandResponse {
     error_code: u32,
 }
 
+/// PRC message payload.
+///
+/// Sent to FSP to query or modify a device configuration knob.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadPrc {
+    sub_message_id: u8,
+    flags: u8,
+    object_id: u8,
+    reserved: u8,
+}
+
+impl NvdmPayloadPrc {
+    /// Constructs a PRC payload from typed protocol fields.
+    fn new(subcmd: PrcMessageSubcmd, object_id: PrcObjectId, flags: PrcFlags) -> Self {
+        Self {
+            sub_message_id: subcmd.into(),
+            flags: flags.into(),
+            object_id: object_id.into(),
+            reserved: 0,
+        }
+    }
+}
+
+// SAFETY: NvdmPayloadPrc is a packed C struct with only integral fields.
+unsafe impl AsBytes for NvdmPayloadPrc {}
+
+/// PRC response payload containing the knob state value.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadPrcResponse {
+    value_low: u8,
+    value_high: u8,
+    reserved1: u8,
+    reserved2: u8,
+}
+
+impl NvdmPayloadPrcResponse {
+    /// Returns the PRC knob value as a little-endian 16-bit integer.
+    fn value(self) -> u16 {
+        u16::from(self.value_low) | (u16::from(self.value_high) << 8)
+    }
+}
+
+impl TryFrom<NvdmPayloadPrcResponse> for VgpuMode {
+    type Error = kernel::error::Error;
+
+    fn try_from(value: NvdmPayloadPrcResponse) -> Result<Self> {
+        match value.value() {
+            0 => Ok(VgpuMode::Disabled),
+            1 => Ok(VgpuMode::Enabled),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
 /// Common MCTP and NVDM headers shared by all FSP messages.
 #[repr(C, packed)]
 #[derive(Clone, Copy)]
@@ -96,6 +202,17 @@ struct FspResponseHeader {
 // SAFETY: FspResponseHeader is a packed C struct with only integral fields.
 unsafe impl FromBytes for FspResponseHeader {}
 
+/// Complete FSP PRC response including the knob state payload.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspPrcResponse {
+    header: FspResponseHeader,
+    prc_data: NvdmPayloadPrcResponse,
+}
+
+// SAFETY: FspPrcResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspPrcResponse {}
+
 /// Trait implemented by types representing a message to send to FSP.
 ///
 /// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
@@ -183,10 +300,35 @@ fn new<'a>(
 // bytes are initialized.
 unsafe impl AsBytes for FspCotMessage {}
 
+/// Complete FSP PRC message.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspPrcMessage {
+    header: FspMessageHeader,
+    prc: NvdmPayloadPrc,
+}
+
+impl FspPrcMessage {
+    /// Constructs a PRC message.
+    fn new(subcmd: PrcMessageSubcmd, object_id: PrcObjectId, flags: PrcFlags) -> Self {
+        Self {
+            header: FspMessageHeader::new(NvdmType::Prc),
+            prc: NvdmPayloadPrc::new(subcmd, object_id, flags),
+        }
+    }
+}
+
+// SAFETY: FspPrcMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspPrcMessage {}
+
 impl MessageToFsp for FspCotMessage {
     const NVDM_TYPE: NvdmType = NvdmType::Cot;
 }
 
+impl MessageToFsp for FspPrcMessage {
+    const NVDM_TYPE: NvdmType = NvdmType::Prc;
+}
+
 /// Bundled arguments for FMC boot via FSP Chain of Trust.
 pub(crate) struct FmcBootArgs {
     chipset: Chipset,
@@ -342,6 +484,37 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, msg: &M) -> Result<KVec<u8>
         Ok(response_buf)
     }
 
+    /// Reads the active vGPU mode from FSP using the PRC protocol.
+    ///
+    /// Queries FSP's Management Partition for the active vGPU mode knob value.
+    #[expect(dead_code)]
+    pub(crate) fn read_vgpu_mode(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+    ) -> Result<VgpuMode> {
+        let msg = KBox::new(
+            FspPrcMessage::new(
+                PrcMessageSubcmd::Read,
+                PrcObjectId::VgpuMode,
+                PrcFlags::from(PrcFlag::Active),
+            ),
+            GFP_KERNEL,
+        )?;
+
+        let response_buf = self.send_sync_fsp(dev, &*msg)?;
+        let (prc_response, _) =
+            FspPrcResponse::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
+                dev_err!(dev, "PRC response too small: {}\n", response_buf.len());
+                EIO
+            })?;
+
+        let prc_data = prc_response.prc_data;
+
+        VgpuMode::try_from(prc_data).inspect_err(|_| {
+            dev_err!(dev, "Unexpected vGPU mode value: {:#x}\n", prc_data.value());
+        })
+    }
+
     /// Boots GSP FMC via FSP Chain of Trust.
     ///
     /// Builds the CoT message from the pre-configured [`FmcBootArgs`], sends it
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index acc2abbd4b0c..90c642c91a72 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -22,6 +22,8 @@
     /// NVDM message type identifiers carried over MCTP.
     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
     pub(crate) enum NvdmType with TryFrom<Bounded<u32, 8>> {
+        /// PRC (Product Reconfiguration Control) message.
+        Prc = 0x13,
         /// Chain of Trust boot message.
         Cot = 0x14,
         /// FSP command response.
-- 
2.53.0

