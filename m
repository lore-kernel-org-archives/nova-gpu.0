Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15833C1963
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111570; cv=fail; b=uD5mtkJYR851ebp+SaP+j6u/9RtEL2o1SZiEUrvIW//Ur0uEOppjlda8b8nB2q/+/GAGhpsTqgZLibjBd7Zj45VsqI3fS5EDv6neRGwen//UxvC60HOxCwku6RI1F38TKD+WFBZAyJI7RNzFYhA8WaDdnzG1W+BtJcm8I/J6HOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111570; c=relaxed/simple;
	bh=ESTbyb+WjEUidE/4zoxVxFRLmp8z8LxrxzE5fj33s8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G8NXqjTk9P3PMhRUIAM5X4WEYuhQLXlXRdVn8+IbVLaYt43zVG9cx2Jv5KTAj4SrkrbP/tdzPp/ZUN6weF0XAXz8J9baMGvtkvlbnIyc6gtS0tR4nMY1yZC8fL0Utew00HnM5GZoMDC2c47QWQSwPR3XSfzTZoSVoRZ6DWvjcPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sSm+rHG2; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sSm+rHG2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xifF3j0Xs/v0PiD+DO2Ue3nu/687LDuhWFTW0EtyPj/jMAYuco8LrscU+8mvUV6au5MZ+6sRT8boQgg02sFhNSZ6+HT+G2lN7lvCH0l731huX5Kd2W3jl5FakU58MkuW1CgiOIwt57+J6W6AUIsJ3FXtL9U0jnjE7R4cfblk5YYDMnXYepepsLsznc2lZi2TRTVRWIjPRpbrQCaJbvIhXr00P4VkAldC4tfrbFVesrEfN1zZMlEtcVFDEbIoa8meJQzj7erH5Ls25CeMsvjMtMJ2YY061YCPLekBlswBeciteDMtDZF/34VM8lh6r1RNO+xO5QaLvmDfvSoc3RfiAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNhZxZG8G0Cuhjd8R97csOUcjIZ+S8IQuNTtCV0nGOA=;
 b=PMeXDgxksRrcTY1Y9xDbI5exNQoHyVNi2K6kDnLEjyyarmjsdgZZYVSHb7anJL3v7esg/tf2kToxLk8TOvuU/l/sk1CItxFWKRcIujCNc7YjCimHMMJ90mPQBfhTGrq8hghTdckE60uOr6vU0ZYSFf8qjXRalWOGA6AJ0EE1qMS2obpgtFktIk+w0nrpUK6S3qjGlCrgco8T0CrilfnV0rEa66A7JDq+eFySDcMlpUYYGMtVwIWaWt9DI78WmuRiKVuFrIAvK9PJw/0Bni2ze/Q6tmIismZhBvww7LRO0kPZ3HkTElmof/sJM/zALQUHZpBaN3pYy66TW5mYVDginQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNhZxZG8G0Cuhjd8R97csOUcjIZ+S8IQuNTtCV0nGOA=;
 b=sSm+rHG2PhFFqEhD8WSXVhFsVdOrWTJHrvl/WEbcl2ScJi+iPlr6YBuMueIeb/xfwVp/jcCAUQ1qJn1VOZ59dhSR7nxaIpkbXpV57rK29Rl1D6Jpy8r4FukZS30apDiiSPuO/sE2WBDbi+6YXRIBEt7w77afapmHcmzmDXa/93sojFSUBZ3/NLB+qiuS/tPg6MYF9DbguZRHNNsUFjUcTfbJE5r8QJ6uvVN+H0e/zjr0S83fNp0zO+dp3QG2+iqlkkks+i0UOvVIz916yoqSLfcZ/6708LY4ZqYSU94y0uFgLNifbgRZuqruQ7EVS6nOVcqxpX/0V89E5nhzXWYyJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:33 +0000
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
Subject: [PATCH 09/27] gpu: nova-core: add build ID headers to debugfs log buffer dumps
Date: Tue, 18 Aug 2026 20:52:02 -0700
Message-ID: <20260819035221.336390-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f18ad8-d7fb-47ef-4716-08defda54cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3ua50pwj+TMS+04iGMkJdf1sxwIfoA3JNB0d9769YHW8XgcHxmL2Fr45cH8OZbWnu67qqSbJou4rGQ5VvG7IY9VYQFzUisvTIS/d5iVSRzkvY45APqUcmSN2GXjSDbqqjmh6eigd1Bgc5lgNw5PFRy2X3L3VWnqQRn+Zu6mCyYz9UupHUoKcktDDg1SWhyBQejhCFfACVtiILsPVra2nwNZ3YUrIjRjwpsQ5m2katWZqQqB3tLMwVBDrneO3PNjCwgcVNRG4OPyeFmS6WB+MJXheWxWCVzeO3Lh3abSsH4GIF9qGvBYHyfGsKt150aZ77JDiERv2B0I8wF222rK9TmW8nngZBrED96iK0lWOUlKO6gFG44+r00kWdvHuo9CsnZCSefKBOkpKaj6d/x0mwALJQSmMie3pEUth9NQODnvpSuwL84jrAwlWO4vxXWCSV4BZok2z1dSGYmK7Qr4vdCaHDbL/DCdTGabTCBtIOfGcW/BL+DT1+Kv7krUIW517iDHbi8rVaW4JeuCMSn0jC8qYswDR7RBw8Q6NP4Ae4e9hAqbTcTfVyGEeeDMPHHWAHO6QazOafzRbfW3zCrDX4tEB3+2AU/IJohb2dR2xbmEhHdmvYmUbLcSuWBFWTfGkOGrWXQdWLfDBXKDe2gi79gZD1SI37c+E/qcHpcCQYbY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0f/GeY8AGDzBgnmLBBUzS9WT3+osj4lwUxPDzjAYG3ohXmoF0DXSM5MZNMdl?=
 =?us-ascii?Q?coPIL1xQ6yPaNospPy3ps+l3J1wTzfEyeo4T7qVlPYWOFQJw+Yd3kHGGJQJL?=
 =?us-ascii?Q?F9UteLDPmtXKua0dtpQ0auLjFg3kbhNB7RZHaaN6oOQsPWLciUGDINId7wVj?=
 =?us-ascii?Q?uFeyvQwHjM7VvVV5k4krabrCbzgtYPTEMg1Z10+ig6J0oPPg3pew99H2AASS?=
 =?us-ascii?Q?6U4vThKTHvO3niGE6bF1lI3P2M2Aik+5SgUwYpbcDVhPFEg9j8g9b3hRHy50?=
 =?us-ascii?Q?L8Tmdyf3fIEISCW0M9vdzZBXbYXmK4S3xvzpNKyVTiAcRW+s2bo7sdOH8F0M?=
 =?us-ascii?Q?OyogKqz9tR3juz/jStQPDWnP15oTyaFUMMDWSWvV+BR/P7pFUg0nxRnxE5AI?=
 =?us-ascii?Q?k5E7LS8Bu3un8gYtsP0aK629cc30ZQdifnYQzhJxCKgidd4929UP0CqtiBok?=
 =?us-ascii?Q?VOffoWINADkucMhoKJs9s+cVTCjn67KnUm7P57HCNYBLIpro/8ISsEGUupo+?=
 =?us-ascii?Q?A91iRXZAZA6loZk+3kPaSsxNkld0D7dIQ5i/QnZ59awOMb+G0beUs7JfvNQ9?=
 =?us-ascii?Q?Dnky1eMlMomiybWvV2T3K1g8O6aJfhqHzf+x16H0DfubAQRFXo0VAEcGF4qg?=
 =?us-ascii?Q?rz7Xy/sHrXvpVPBoFrZ5gqMaVT9YS6PCNZpCDUm27LJ7AujI7cqjucAvncXa?=
 =?us-ascii?Q?3WxOgEHcInzv009ULxICH9AQVNOSEuDIlSIhRo+NjtT9M5vlCbTpFoFc+tJR?=
 =?us-ascii?Q?f11bWOm273/semd+jz0+clZ6bzHiGJhfw+k6PqxftPOKe/8vdqzLvKQj9zGU?=
 =?us-ascii?Q?kAQjVirwEoC5U+Wi6Pw9JabNvGCrIo/8x+VE8ZbsM7oj6ToWQw/QreraVWy5?=
 =?us-ascii?Q?bKz6Ke1rr7Rz9WL2tc3uJslqkDDvJNw8iGxaqHpVVx1NumGjSI+/LgIhTTzx?=
 =?us-ascii?Q?zOe7eoJ3ZiDYlkn3dq+jfWGiYIyUIaXv2DAuF/Mo/pQWLldx4xbnekbpqWer?=
 =?us-ascii?Q?PuqcWTzx/LwyLcklbONEVvxBbIAK27NK2FYGuJVDE1AMcb94eek+6OonyzJp?=
 =?us-ascii?Q?94N+7K+Vjuvl5/Uvu2otnFVrfyhyIfYKebwIRq9pV6kZWb0VFggKIi9mLTnb?=
 =?us-ascii?Q?9nYWxBy9Cr29ra70s3i9hUYeBdCP1aCFwuvDWUCVee2h8Rl+/j+gVvxNubEX?=
 =?us-ascii?Q?iyo3W+RBEsbo0UxR5nudJZ6c89H7TCsg32DyGOiwwJ4KUVGuyWN122Xg97i3?=
 =?us-ascii?Q?l2HZI67hwh1tDZwNMRzPtVbvib5VdBDC4kQKnxcCJpSbDN+iPb7ub5NRU2Mi?=
 =?us-ascii?Q?SNhn43Ic0ReVoE4TI6CcX1bDAdc+hY0uCpA3Rt+k8jlOAmr24rlHa+kMNuge?=
 =?us-ascii?Q?TJjrUFlSbA50NDn+nKZE9Qm3bztCtRtIEAhiJHD9Sd2Nb0lxSgK6iwuHEC3X?=
 =?us-ascii?Q?tuMTq+Sl7wuBzObLM9ipPc8pF9fhJ2ATPKI1sBmiWMOX1lXvtIxIQSp5rDgG?=
 =?us-ascii?Q?WazGTRKs0jHugKRny0+34R1+rpY+wI6jSpy4v1Pg66Gjn4H98SdtVSSkUW6s?=
 =?us-ascii?Q?r+cyFngwA16GtNKz9kMSF3bPwMIZOpfdRALTmGUX0DM4H8DWpet6cUrctJco?=
 =?us-ascii?Q?b9XwexHxbuXi9OznoF/mP5Pyk1muVP04XsOjE1xu8mgJ4GLwPgrg9yEay7Hn?=
 =?us-ascii?Q?rPkl/Qq3Easd1LE2rFZjv6bPUepgfIqejnC4iJb33WJkY3QR90botsLn6Mfb?=
 =?us-ascii?Q?iRmHHnERSw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f18ad8-d7fb-47ef-4716-08defda54cd0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:33.4577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ejLzRXjO93Bi7J+s4PJTeTDNbRSNzjHAcfwrmBFiTajca1cjcwgdXexGmZlMOiUdkTVCnk6yXx1JfGxM+944A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

A raw log buffer dump cannot be decoded without knowing which firmware
build produced it, and which GPU and metadata format it belongs to.
GSP-RM's own decoder takes that from a header ahead of the data, in the
LIBOS_LOG_NVLOG_BUFFER_V2 layout.

Prepend that header to each debugfs dump. The build ID comes from the
BLID tag of gsp.tlv, so request the metadata once when the GSP manager
is created and hand it to the firmware loader rather than requesting it
again during boot. A buffer whose build ID is missing serves its
contents with no header.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  34 +++++
 drivers/gpu/nova-core/firmware/gsp.rs |   8 +-
 drivers/gpu/nova-core/gpu.rs          |   2 +-
 drivers/gpu/nova-core/gsp.rs          | 185 ++++++++++++++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs     |   2 +-
 5 files changed, 200 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index dfd41364cc77..e0befe84aa3e 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -31,6 +31,40 @@
 pub(crate) mod riscv;
 pub(crate) mod tlv;
 
+/// Maximum length of a build ID, matching Open RM's `BUILD_ID_MAX_LENGTH`.
+const BUILD_ID_MAX_LENGTH: usize = 32;
+
+/// Build ID extracted from firmware, used to correlate debugfs log buffer dumps
+/// with the correct firmware symbols.
+pub(crate) struct BuildId {
+    bytes: [u8; BUILD_ID_MAX_LENGTH],
+    len: u8,
+}
+
+impl BuildId {
+    /// Constructs a [`BuildId`] from raw descriptor bytes.
+    ///
+    /// Returns `None` if `data` is empty or exceeds [`BUILD_ID_MAX_LENGTH`].
+    pub(crate) fn from_raw(data: &[u8]) -> Option<Self> {
+        if data.is_empty() || data.len() > BUILD_ID_MAX_LENGTH {
+            return None;
+        }
+
+        let mut bytes = [0u8; BUILD_ID_MAX_LENGTH];
+        bytes[..data.len()].copy_from_slice(data);
+
+        Some(Self {
+            bytes,
+            len: data.len() as u8,
+        })
+    }
+
+    /// Returns the build ID bytes.
+    pub(crate) fn as_bytes(&self) -> &[u8] {
+        &self.bytes[..usize::from(self.len)]
+    }
+}
+
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone, FromBytes)]
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 48c73a676ecb..832debb82767 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -16,8 +16,8 @@
         radix3::Radix3,
         riscv::RiscvFirmware, //
         tlv::{
-            request_tlv, //
-            Tlv,
+            request_tlv,
+            Tlv, //
         },
     },
     gpu::Chipset,
@@ -48,10 +48,10 @@ impl GspFirmware {
     pub(crate) fn new<'a>(
         dev: &'a device::Device<device::Bound>,
         chipset: Chipset,
+        gsp_tlv: &'a firmware::Firmware,
     ) -> impl PinInit<Self, Error> + 'a {
         pin_init::pin_init_scope(move || {
-            let firmware = request_tlv(dev, chipset, "gsp")?;
-            let tlv = Tlv::new(firmware.data())?;
+            let tlv = Tlv::new(gsp_tlv.data())?;
             let fw_version = CString::try_from_fmt(fmt!("{}", tlv.get_string(b"VERS")?))?;
             dev_dbg!(
                 dev,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 11a66a597298..c0ba561a3bf1 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -396,7 +396,7 @@ pub(crate) fn new(
 
                 vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut()),
 
-                gsp <- Gsp::new(pdev),
+                gsp <- Gsp::new(pdev, spec.chipset),
 
                 // This member must be initialized last, so the `UnloadBundle` can never be dropped
                 // from outside of the constructed `GspResources`, ensuring that the unload sequence
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f19a47cf396f..232905638169 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -12,6 +12,7 @@
         CoherentView,
         DmaAddress, //
     },
+    fs::file,
     io::{
         io_project,
         io_write,
@@ -19,7 +20,8 @@
     },
     pci,
     prelude::*,
-    sync::Arc, //
+    sync::Arc,
+    uaccess::UserSliceWriter, //
 };
 
 pub(crate) mod cmdq;
@@ -45,6 +47,13 @@
         sec2::Sec2 as Sec2Falcon,
         Falcon, //
     },
+    firmware::{
+        tlv::{
+            request_tlv,
+            Tlv, //
+        },
+        BuildId, //
+    },
     fsp::Fsp,
     gpu::Chipset,
     gsp::{
@@ -104,6 +113,50 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
     }
 }
 
+/// Size of the header prepended to debugfs log buffer dumps.
+///
+/// This header makes each dump self-describing so that decoding tools can
+/// identify the firmware build, GPU architecture, and metadata format without
+/// out-of-band information.
+const LOG_BUFFER_HEADER_SIZE: usize = 0x48;
+
+/// Build a log buffer header from GPU and firmware metadata.
+///
+/// Layout (all little-endian):
+///   0x00  gpuArch (u32)
+///   0x04  gpuImpl (u32)
+///   0x08  version (u32) = 2
+///   0x0C  buildIdLength (u32)
+///   0x10  taskPrefix[8]
+///   0x18  localToGlobalTimerDelta (u64) = 0
+///   0x20  buildId[32]
+///   0x40  flags (u32) = 1 (packed metadata)
+///   0x44  reserved (u32) = 0
+fn build_log_buffer_header(
+    chipset: Chipset,
+    build_id: &BuildId,
+    task_prefix: &str,
+) -> [u8; LOG_BUFFER_HEADER_SIZE] {
+    let mut h = [0u8; LOG_BUFFER_HEADER_SIZE];
+    let chipset_val = chipset as u32;
+
+    h[0x00..0x04].copy_from_slice(&(chipset_val >> 4).to_le_bytes());
+    h[0x04..0x08].copy_from_slice(&(chipset_val & 0xF).to_le_bytes());
+    h[0x08..0x0C].copy_from_slice(&2u32.to_le_bytes());
+
+    let bid = build_id.as_bytes();
+    h[0x0C..0x10].copy_from_slice(&(bid.len() as u32).to_le_bytes());
+
+    let prefix = task_prefix.as_bytes();
+    let prefix_len = prefix.len().min(8);
+    h[0x10..0x10 + prefix_len].copy_from_slice(&prefix[..prefix_len]);
+
+    h[0x20..0x20 + bid.len()].copy_from_slice(bid);
+    h[0x40..0x44].copy_from_slice(&1u32.to_le_bytes());
+
+    h
+}
+
 /// The logging buffers are byte queues that contain encoded printf-like
 /// messages from GSP-RM.  They need to be decoded by a special application
 /// that can parse the buffers.
@@ -122,7 +175,13 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 /// `SIZE` is the buffer size in bytes and `NUM_PAGES` is the same size in GSP pages, checked
 /// against each other at build time. Computing one from the other in a type position is not
 /// stable Rust, so both are parameters.
-struct LogBuffer<const SIZE: usize, const NUM_PAGES: usize>(Coherent<[u8; SIZE]>);
+///
+/// When a build ID is available, the debugfs file for this buffer prepends
+/// a header so the dump is self-describing.
+struct LogBuffer<const SIZE: usize, const NUM_PAGES: usize> {
+    header: Option<[u8; LOG_BUFFER_HEADER_SIZE]>,
+    buffer: Coherent<[u8; SIZE]>,
+}
 
 /// Log buffer for a task that GSP-RM logs to at its default size.
 ///
@@ -137,21 +196,72 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 
 impl<const SIZE: usize, const NUM_PAGES: usize> LogBuffer<SIZE, NUM_PAGES> {
     /// Creates a new `LogBuffer` mapped on `dev`.
-    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+    fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        build_id: Option<&BuildId>,
+        task_prefix: &str,
+    ) -> Result<Self> {
         build_assert!(SIZE == NUM_PAGES * GSP_PAGE_SIZE);
 
-        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
-
-        let start_addr = obj.0.dma_address();
+        let buffer = Coherent::zeroed(dev, GFP_KERNEL)?;
 
+        let start_addr = buffer.dma_address();
         let pte_view = io_project!(
-            obj.0,
+            buffer,
             [build: size_of::<u64>()..][build: ..NUM_PAGES * size_of::<u64>()]
         )
         .try_cast::<PteArray<NUM_PAGES>>()?;
         PteArray::init(pte_view, start_addr)?;
 
-        Ok(obj)
+        let header = build_id.map(|bid| build_log_buffer_header(chipset, bid, task_prefix));
+
+        Ok(Self { header, buffer })
+    }
+}
+
+impl<const SIZE: usize, const NUM_PAGES: usize> debugfs::BinaryWriter
+    for LogBuffer<SIZE, NUM_PAGES>
+{
+    fn write_to_slice(
+        &self,
+        writer: &mut UserSliceWriter,
+        offset: &mut file::Offset,
+    ) -> Result<usize> {
+        if offset.is_negative() {
+            return Err(EINVAL);
+        }
+
+        let offset_val: usize = (*offset).try_into().map_err(|_| EINVAL)?;
+        let header = self.header.as_ref().map_or(&[][..], |h| h.as_slice());
+        let total_len = header.len() + self.buffer.size();
+
+        if offset_val >= total_len {
+            return Ok(0);
+        }
+
+        let count = (total_len - offset_val).min(writer.len());
+        if count == 0 {
+            return Ok(0);
+        }
+
+        let mut written = 0;
+
+        if offset_val < header.len() {
+            let hdr_count = (header.len() - offset_val).min(count);
+            writer.write_slice(&header[offset_val..offset_val + hdr_count])?;
+            written += hdr_count;
+        }
+
+        if written < count {
+            let buf_start = offset_val.saturating_sub(header.len());
+            let buf_count = count - written;
+            writer.write_dma(&self.buffer, buf_start, buf_count)?;
+            written += buf_count;
+        }
+
+        *offset += written as i64;
+        Ok(written)
     }
 }
 
@@ -180,9 +290,11 @@ struct LogBuffers {
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp {
+    /// Preloaded GSP firmware TLV metadata used during boot.
+    gsp_tlv: kernel::firmware::Firmware,
     /// Libos arguments.
     pub(crate) libos: Coherent<[LibosMemoryRegionInitArgument]>,
-    /// Log buffers, optionally exposed via debugfs.
+    /// Log buffers for all LIBOS3 tasks, exposed via debugfs.
     #[pin]
     logs: debugfs::Scope<LogBuffers>,
     /// Command queue, shared with the GSP event interrupt handler.
@@ -195,18 +307,32 @@ pub(crate) struct Gsp {
 
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
-    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+    pub(crate) fn new(
+        pdev: &pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl PinInit<Self, Error> + '_ {
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
-            let loginit = TaskLogBuffer::new(dev)?;
-            let logintr = TaskLogBuffer::new(dev)?;
-            let logrm = TaskLogBuffer::new(dev)?;
-            let logmnoc = TaskLogBuffer::new(dev)?;
-            let logroot = SmallLogBuffer::new(dev)?;
-            let logrmon = SmallLogBuffer::new(dev)?;
+            let gsp_tlv = request_tlv(dev, chipset, "gsp")?;
+            let tlv = Tlv::new(gsp_tlv.data())?;
+            let build_id = tlv.get_bytes(b"BLID").ok().and_then(BuildId::from_raw);
+            if build_id.is_none() {
+                dev_warn!(
+                    pdev,
+                    "GSP firmware build ID not found, log buffer headers omitted\n"
+                );
+            }
+
+            let loginit = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "INIT")?;
+            let logintr = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "INTR")?;
+            let logrm = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "RM")?;
+            let logmnoc = TaskLogBuffer::new(dev, chipset, build_id.as_ref(), "MNOC")?;
+            let logroot = SmallLogBuffer::new(dev, chipset, build_id.as_ref(), "ROOT")?;
+            let logrmon = SmallLogBuffer::new(dev, chipset, build_id.as_ref(), "RMON")?;
 
             Ok(try_pin_init!(Self {
+                gsp_tlv,
                 cmdq: Arc::pin_init(Cmdq::new(dev), GFP_KERNEL)?,
                 rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(cmdq.as_ref()))?,
                 rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
@@ -217,9 +343,18 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         GFP_KERNEL,
                     )?;
 
-                    libos.init_at(0, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-                    libos.init_at(1, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-                    libos.init_at(2, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+                    libos.init_at(
+                        0,
+                        LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.buffer),
+                    )?;
+                    libos.init_at(
+                        1,
+                        LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.buffer),
+                    )?;
+                    libos.init_at(
+                        2,
+                        LibosMemoryRegionInitArgument::new("LOGRM", &logrm.buffer),
+                    )?;
                     libos.init_at(3, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
 
                     libos.into()
@@ -245,12 +380,12 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         .expect("DEBUGFS_ROOT not initialized");
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
-                        dir.read_binary_file(c"loginit", &logs.loginit.0);
-                        dir.read_binary_file(c"logintr", &logs.logintr.0);
-                        dir.read_binary_file(c"logrm", &logs.logrm.0);
-                        dir.read_binary_file(c"logmnoc", &logs.logmnoc.0);
-                        dir.read_binary_file(c"logroot", &logs.logroot.0);
-                        dir.read_binary_file(c"logrmon", &logs.logrmon.0);
+                        dir.read_binary_file(c"loginit", &logs.loginit);
+                        dir.read_binary_file(c"logintr", &logs.logintr);
+                        dir.read_binary_file(c"logrm", &logs.logrm);
+                        dir.read_binary_file(c"logmnoc", &logs.logmnoc);
+                        dir.read_binary_file(c"logroot", &logs.logroot);
+                        dir.read_binary_file(c"logrmon", &logs.logrmon);
                     })
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index e03700ee7bea..a64313dca0a1 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -42,7 +42,7 @@ pub(crate) fn boot(
         let dev = pdev.as_ref();
         let hal = super::hal::gsp_hal(chipset);
 
-        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
+        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, &self.gsp_tlv), GFP_KERNEL)?;
 
         // Perform the chipset-specific boot sequence, and retrieve the unload bundle.
         let unload_bundle = hal.boot(&self, &mut ctx, &gsp_fw)?.or_else(|| {
-- 
2.55.0

