Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6974B3BFE33
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 02:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697600; cv=fail; b=INQyiETpQQFXKEeDNGXHIyWD6OaKH6HlSC/KaVTkUTptqOUhZhuP44y2njEVidbSrPuAIOceDcqv7qDW+kqHW7OTxYkeppOfDqS+/gyoL9aUvONOnZErp4z7hBAEBepcKferJ1rohFW9cvSMn+LRfDTqR1JCp8wUTbgAGeY8a/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697600; c=relaxed/simple;
	bh=+0eqoK5pcv3Y2HZFECWQxfFFs7N5g7fHCKccxnYetlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O3UdIRsy/IODQ89VFLz583ZqlpaPi8LPMlUiaAUUVMNt7fF+XImBXQHPrVkCFJx88/EUqUDmd+uhbF5P4lp2MPz0+/x4vuMZbVfNrm7GMOCurPEAOUgM0P/ksXzQd0vgplQNOjurlkLJYZo4d0MSrrxoCCiqOSq3WTjcD6KebuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pWU0H220; arc=fail smtp.client-ip=52.101.53.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pWU0H220"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNNueH5FpcgVHBRqhl1CEnBHwND8Zk9LldjsL+fCP/AOjhFBaonV0zPUWG0sJCmKHr8pfVpP0mwZMmMpSSKbJua3KE+Kc2OrChjNZXd57mbkC6mxszLdJFWsDRtLwGoThcidqXi29+zYEQ3lPebPZj2d3s8TZ/YMxu/uObqRIDE46sH6wK3hO6KEwQwxNKXCSdbh9tb5ZDSxzmR0IcZxA+74K1MRxHksd9KHnsrOGCPiNrKHSKg0ugc2q+nxPfo2wkUiY7oKq6l9x1ZemI6t/pouRZxB6Xi80YDxX9UyCcZO6cqC9B2vCXk8YgH1N8jc+4do5vzQjY0SpVzNSU7MkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srbYfeC+SwEpkOkOnyUszSb33ae41QO8+svUxO261Kg=;
 b=HEBobs8RkS+wBMW4pB9qAh2xQk7CKZIRWkPL1bbvY+CCnaSyeSzUY0IAq7dkQsIT1WAbfduuHte14F0Zd5DM/9ZgYNcLja1aJSEN4bOEg0KjjZIMa9SQt/U+Lte/PNxLkxzbHezsduF02k3AydOeiW3wedFsOJmPPec+4+xwEOMzzf7ouJQK02lOm966n+5FNo0AfAEqS+SMCqAEvyc1S/z+zsQBbYXHGJagdhLN3vwDxhbcqIQhsjTpYNCukFIeon8HwVD+HbodVboopn8vhlI0DUGAspPBVE5aCQgGvTj56ot959L9pPYtd35VuJ90GHQ8uvq3aVwxbiEE68RJMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srbYfeC+SwEpkOkOnyUszSb33ae41QO8+svUxO261Kg=;
 b=pWU0H220mODKiYSYnx+PMkxTBncCee9DWBm6if+wttbb560qSm7huVIEfey4xF9F25ZpIZF7PtoS9kjmk9QZFKMrp0MBdkCsSbzqbJQrITLOphrziZGMFS9zmb40HOop2+U5Jc7HSnsedF5KEMwe17sME5mk43QZaqFg7yjQTWNluyBsBShRh2kheOKvlYmgLsLfsGIgHe0/racVHTRwFq2MiYYUhv216OXsoTFYZtciAggf90YVeov5znq4m8o92oiGZ+4EKAViWTi+OFOd7k1lbqqw9lcs9ty/MVPkvf3z18Hb0KCMkdJ+Yn4K2/qgqlOsQ3lJABR1LLxeUodxBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.12; Fri, 18 Sep 2026 02:13:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 02:13:05 +0000
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
Subject: [PATCH 2/4] gpu: nova-core: enable decoding of the GSP firmware logs
Date: Thu, 17 Sep 2026 19:12:47 -0700
Message-ID: <20260918021249.1187837-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918021249.1187837-1-jhubbard@nvidia.com>
References: <20260918021249.1187837-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0113.namprd07.prod.outlook.com
 (2603:10b6:510:4::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d7dab1-d844-4d4b-10ea-08df152a5fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|366016|376014|10067099003|3023799007|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	58gM2xwnp1nDGIA8WPuX8VeQ6si2McUHXvDHtNsAWIeJN2/D4v9v/SUSe02ZGfOTfbvW+nXp+eu/Igc0UWesS3OgI2kwrFDTbenHWC/vdBc5mGv3P//T8qZ/y8J+AFPplb3usp5kCr3/6rLW8j1HLzoyvNVrApwbsi4Gylf931w5am5U+i4elWZCnhXAXDbpOj4LyNhucrNWFP6WPttEpw7F6NvzwBCf7iiGGiyTIU2LUfZFH+jFeX1nG2wTLNVurXvFOAvL0vTetxHaj9a4iprLgRN71WKc9adY7ewbIRtNwVKAZTtNqTM4miu3e2BTDSCTO1QGx34+aHVXavJpvHhMWW9TGmOWhacFzD9l8+ExSnnxJMOsQ2GKzdLBvvjGkBcERRm4/ZxPcDZRHOC35FdKwiw9Q5hr5MiJT3hHg0VuNUgfSXsLEdIbHju4aurY+2qDHcdduGviUDjiZKTXvRa1Jn7NFh+iERu+EaejPac2uxKNg50Ka0nbP57RO4ao8KazJoZzDNKgD/cLjCi/WBXIsMGEtruLCMUyVMfULYDc+4wb9ktLYcFWjM7SnIuxhpKvwl6jabZ2J8QTU+sbwRWenVVxMsNlwls7z+uxQyLJ9wvI29yFs7mFpeI/iU3HWK9Pu0hBAxUXGw5Bb+nop6oxB1EV+HEwb4Dh2jtmtgE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(366016)(376014)(10067099003)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qealAau2pjf9LWaLYe9jXdySrai0KDcusgvNa4TpDjjRdbrn7bBqYeu/5StL?=
 =?us-ascii?Q?egPD6WGrgQ4Cjs0q5uOScFzwGXJogzKMDFBcyCTohqebfi9gJ/+4e8tv06KW?=
 =?us-ascii?Q?z2/+MQKVST48r3Nu1Q2J116bzNfoqeUt/law+/bRHplbYnJvonDfxHcA78WC?=
 =?us-ascii?Q?OhWRcoeIG87cE5VgPA3oYli1iB3ykh/kaLMrzPXNMUgY2VD4X+uxQWx75Ixd?=
 =?us-ascii?Q?Uxr2OcYL22aCpnE6GSCbKTBsjgCRuYKvXFCdbS6tB90pYrxGstAkq4W3yY4t?=
 =?us-ascii?Q?DKFrKoKXF8sB67NPSQxySr/8R1SLMwUDRBzjqUGO/NuJ250fzFHTYUPPwcpK?=
 =?us-ascii?Q?AcCwFQ4DB83pT8ggZCI5KlpRMMmCqUDpv1l1/l0C/iED1pqB3ZLDeSt06ecc?=
 =?us-ascii?Q?XzUbQNDRYFk0d+O7v3/Z7LVOF9hCFzX+vs45LrvCRR4+v36cnDFxk7EdP/nK?=
 =?us-ascii?Q?lLQuSLQklJP75ju7rZWlqziP9htsSgySkIFc32VfpYNK0CtNGOJuwafPWpi9?=
 =?us-ascii?Q?ffa6LazuMEcC7MdZrnU+UYw8sAuwtWceiz0sD2X9klOc+3aO6wAT0tLjfNgW?=
 =?us-ascii?Q?W+4g+VCwpm2Ht6RQgI/vg7CR0gNiLD3ykde8MNwj+sUbTR7BmuIo5x46wuF1?=
 =?us-ascii?Q?XJz3gLi5FUuAf1/Kr08Wg6gg4oEvwM4JWKYb4L+HdLcgkFymT01JJeRInC9x?=
 =?us-ascii?Q?HfuggmRVj874KZz1Ck9Gzi+1Nf4ZRKWnBfodvRqfpPbjN1Rcz0E18K6fT7TU?=
 =?us-ascii?Q?DIV4m1QRVmiNsNlzQOdwzOQjefatR8oGsror3ZXfJg5+Wy9vp5dFledzJjLV?=
 =?us-ascii?Q?iddu8sbSszYYKr4HKovIGmOyMKYdEUyWSTNepFhjmugi/hCQCeaGofD0Z5Ij?=
 =?us-ascii?Q?PaDeORZ1tQ215lV+EUxP+A7j3FgzYoasLEOSWmBxpWxqpaETJuNGGyftyNQA?=
 =?us-ascii?Q?FcSKfHUnHgLjh0ydYDdaIphKeefTedGEuMX2MRGgjlRtF7v90+srjkuU58pN?=
 =?us-ascii?Q?cwMOs9vrrEy4ZMXy15g3a/WtRdCpGBDERYvslrIViPLszkvKCx30B6wNjiEx?=
 =?us-ascii?Q?tORJRtAn6Y7vDwYGS0MwUIx937EcL5bNKV6qgkBcu4wdH7MEYfUMWV/uXZBo?=
 =?us-ascii?Q?dcClAMkT+J7AvmQawPXM/LzpfpWzilSCuGllyOExyfjhjnZtVm+POe5/IWPU?=
 =?us-ascii?Q?+YocdsWw4PUEcAlGWBxgFBD90NRzYio4ZC0DJqWODraLVYtCnsuCd8wl6tkS?=
 =?us-ascii?Q?DIE6Zxd4CaebhEWvLSXIbv1Xd60WdkfRsBjXhQEyw/mhukqT0MXbqWouOt/z?=
 =?us-ascii?Q?D2SgvDU46FnbPSMqoItO0aA0pxJSyIhEFQNPOEbfquwM+34i9Yw5d8FPlrOd?=
 =?us-ascii?Q?GSjWOY1HidqAA9PMr4VnkDsCe1Wx39eSPwAb0C5CooUIerpEL2uhfiuZfAsy?=
 =?us-ascii?Q?mR6ls9wba9iRIKRat07IOzPlhprN8CASfmAYOrlrMKqqxSayCQ9HuKHNa4G6?=
 =?us-ascii?Q?E68rq7qBcHKYVZqbGt9thbMZTerP8e2IkZn6vyi2TNK+eQfJ28XbWrdQcf+/?=
 =?us-ascii?Q?6YXrM7Kl2GgCTY+P8ZC/pzVmpL7JfqEqZjXVyIl4i3Zjbbaauo0A/usmDYgU?=
 =?us-ascii?Q?dfug8PCMaGxqbpFjEWpB9cIKPvVDIRmXkTua0O9g3MvVoA+3yqQ0/2DhYKT/?=
 =?us-ascii?Q?vzE6nCUyJPrY+wvtsDDPj4kx/Rc8auFoUNvmRKAltQuyQy3Cenft2jJoF/Tf?=
 =?us-ascii?Q?HFZLm4H4gA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d7dab1-d844-4d4b-10ea-08df152a5fce
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 02:13:05.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNJTsD2toawnspc43rVjWxl7NtEDJAtKNWRvSdVX1eEh4EmFyKsCCVK9Q0fQn/ijYcLlaUWtPCY33C7LDnbMFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015

Nova-core exports the GSP-RM log buffers over debugfs, and Open RM's
log decoder turns a dump into text with the ELF of the firmware that
wrote it. The decoder identifies that firmware by a header ahead of
each buffer. The header, in the LIBOS_LOG_NVLOG_BUFFER_V2 layout, names
the GPU, the firmware task that wrote the buffer, and the GNU build ID
of the firmware.

Nova-core wrote no such header, so a dump could not be matched to its
firmware, and a decode with the wrong ELF produced garbage rather than
an error.

Prepend the header to each debugfs dump, with the build ID read from
the BLID tag of gsp.tlv. The log buffers are created before boot loads
the firmware from that file, so request the file once when the buffers
are created and hand it to the boot sequence. A file without a usable
build ID is reported with a warning, and its dumps carry no header.

Also, r000 has several more log buffers that must be provisioned, so do
that too.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs |  54 ++++++-
 drivers/gpu/nova-core/gpu.rs          |   3 +-
 drivers/gpu/nova-core/gsp.rs          | 212 ++++++++++++++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs     |   2 +-
 4 files changed, 234 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index a2db7b6ba131..e6ca8d559d7b 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -6,6 +6,7 @@
         Coherent,
         DmaAddress, //
     },
+    firmware,
     prelude::*, //
 };
 
@@ -21,6 +22,48 @@
     gpu::Chipset, //
 };
 
+/// Longest build ID that a log dump header carries, matching Open RM's `BUILD_ID_MAX_LENGTH`.
+pub(crate) const BUILD_ID_MAX_LENGTH: usize = 32;
+
+/// Build ID of the GSP firmware, from the `BLID` tag of its TLV.
+pub(crate) struct BuildId {
+    /// The ID, zero-padded to [`BUILD_ID_MAX_LENGTH`] bytes.
+    bytes: [u8; BUILD_ID_MAX_LENGTH],
+    /// Number of valid bytes in `bytes`.
+    len: u32,
+}
+
+impl BuildId {
+    /// Reads the build ID from the `BLID` tag of `tlv`.
+    ///
+    /// Returns `EINVAL` if the tag is absent or empty, or if its value is longer than
+    /// [`BUILD_ID_MAX_LENGTH`] bytes.
+    pub(crate) fn from_tlv(tlv: &Tlv<'_>) -> Result<Self> {
+        let value = tlv.get_bytes(b"BLID")?;
+
+        let mut bytes = [0; BUILD_ID_MAX_LENGTH];
+        bytes
+            .get_mut(..value.len())
+            .ok_or(EINVAL)?
+            .copy_from_slice(value);
+
+        Ok(Self {
+            bytes,
+            len: u32::try_from(value.len())?,
+        })
+    }
+
+    /// Returns the ID, zero-padded to [`BUILD_ID_MAX_LENGTH`] bytes.
+    pub(crate) fn padded(&self) -> &[u8; BUILD_ID_MAX_LENGTH] {
+        &self.bytes
+    }
+
+    /// Returns the number of bytes in the ID.
+    pub(crate) fn len(&self) -> u32 {
+        self.len
+    }
+}
+
 /// The GSP firmware image, its signatures, and the GSP bootloader.
 #[pin_data]
 pub(crate) struct GspFirmware<'a> {
@@ -36,13 +79,16 @@ pub(crate) struct GspFirmware<'a> {
 impl<'a> GspFirmware<'a> {
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
-    pub(crate) fn new(
+    ///
+    /// `gsp_tlv` is the TLV of the GSP firmware, which names the image file and carries the
+    /// signatures.
+    pub(crate) fn new<'tlv>(
         dev: &'a device::Device<device::Bound>,
         chipset: Chipset,
-    ) -> impl PinInit<Self, Error> + 'a {
+        gsp_tlv: &'tlv firmware::Firmware,
+    ) -> impl PinInit<Self, Error> + use<'a, 'tlv> {
         pin_init::pin_init_scope(move || {
-            let firmware = request_tlv(dev, chipset, "gsp")?;
-            let tlv = Tlv::new(firmware.data())?;
+            let tlv = Tlv::new(gsp_tlv.data())?;
             dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
 
             let fw_vvec = tlv.load_file(dev, chipset)?;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index cecd8e79430d..173c57179b39 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -220,7 +220,6 @@ pub(crate) struct Spec {
     pub(crate) chipset: Chipset,
     /// Implementation field of `NV_PMC_BOOT_42`, which distinguishes this chipset from the other
     /// chipsets of its architecture.
-    #[expect(dead_code)]
     pub(crate) implementation: u8,
     revision: Revision,
 }
@@ -424,7 +423,7 @@ pub(crate) fn new<'a>(
 
                 vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut()),
 
-                gsp <- Gsp::new(pdev, bar),
+                gsp <- Gsp::new(pdev, *spec, bar),
 
                 // This member must be initialized last, so that the unload bundle can never be
                 // dropped from outside the constructed `GspResources`, and the unload sequence runs
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 85967119cd7e..f8c675288d58 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -12,13 +12,17 @@
         CoherentView,
         DmaAddress, //
     },
+    firmware,
+    fs::file,
     io::{
         io_project,
         io_write,
         Io, //
     },
     pci,
-    prelude::*, //
+    prelude::*,
+    transmute::AsBytes,
+    uaccess::UserSliceWriter, //
 };
 
 pub(crate) mod cmdq;
@@ -42,8 +46,21 @@
         sec2::Sec2 as Sec2Falcon,
         Falcon, //
     },
+    firmware::{
+        gsp::{
+            BuildId,
+            BUILD_ID_MAX_LENGTH, //
+        },
+        tlv::{
+            request_tlv,
+            Tlv, //
+        },
+    },
     fsp::Fsp,
-    gpu::Chipset,
+    gpu::{
+        Chipset,
+        Spec, //
+    },
     gsp::{
         cmdq::Cmdq,
         fw::GspArgumentsPadded, //
@@ -100,6 +117,68 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
     }
 }
 
+/// Longest task name in a log dump header, matching Open RM's `TASK_NAME_MAX_LENGTH`.
+const TASK_NAME_MAX_LENGTH: usize = 8;
+
+/// Header ahead of the log data in a debugfs dump, in the layout of Open RM's
+/// `LIBOS_LOG_NVLOG_BUFFER_V2`.
+///
+/// The decoder uses the header only when `build_id` matches the build ID of its GSP firmware ELF.
+#[repr(C)]
+struct LogBufferHeader {
+    /// Architecture code of the GPU, from the `NV_PMC_BOOT_42` architecture field.
+    gpu_arch: u32,
+    /// Implementation number of the GPU within its architecture.
+    gpu_impl: u32,
+    version: u32,
+    /// Number of valid bytes in `build_id`.
+    build_id_length: u32,
+    /// Name of the LIBOS3 task, printed ahead of each decoded line.
+    task_prefix: [u8; TASK_NAME_MAX_LENGTH],
+    /// Value that the decoder adds to each timestamp, zero when unknown.
+    local_to_global_timer_delta: u64,
+    /// Build ID of the GSP firmware, zero-padded.
+    build_id: [u8; BUILD_ID_MAX_LENGTH],
+    /// `LIBOS_LOG_NVLOG_BUFFER_FLAG_*` bits.
+    flags: u32,
+    reserved: u32,
+}
+
+// SAFETY: `LogBufferHeader` is `repr(C)`, its integer and byte array fields leave no padding
+// between or after them, and it has no interior mutability.
+unsafe impl AsBytes for LogBufferHeader {}
+
+impl LogBufferHeader {
+    /// The `LIBOS_LOG_NVLOG_BUFFER_V2` layout.
+    const VERSION: u32 = 2;
+    /// `LIBOS_LOG_NVLOG_BUFFER_FLAG_PACKED_METADATA`: each log entry packs its argument count and
+    /// task id into the word that holds its metadata address.
+    const FLAG_PACKED_METADATA: u32 = 0x1;
+
+    /// Builds the header for a dump of the `task_prefix` task's log, on the GPU that `spec`
+    /// describes, whose GSP runs the firmware with `build_id`.
+    fn new(spec: Spec, build_id: &BuildId, task_prefix: &str) -> Self {
+        let mut header = Self {
+            gpu_arch: spec.chipset.arch() as u32,
+            gpu_impl: u32::from(spec.implementation),
+            version: Self::VERSION,
+            build_id_length: build_id.len(),
+            task_prefix: [0; TASK_NAME_MAX_LENGTH],
+            local_to_global_timer_delta: 0,
+            build_id: *build_id.padded(),
+            flags: Self::FLAG_PACKED_METADATA,
+            reserved: 0,
+        };
+
+        // The last byte stays zero, so that the name is NUL-terminated for the decoder.
+        let prefix = task_prefix.as_bytes();
+        let len = prefix.len().min(TASK_NAME_MAX_LENGTH - 1);
+        header.task_prefix[..len].copy_from_slice(&prefix[..len]);
+
+        header
+    }
+}
+
 /// The logging buffers are byte queues that contain encoded printf-like
 /// messages from GSP-RM.  They need to be decoded by a special application
 /// that can parse the buffers.
@@ -114,7 +193,13 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 /// then pp points to index into the buffer where the next logging entry will
 /// be written. Therefore, the logging data is valid if:
 ///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer<'a, const NUM_PAGES: usize>(Coherent<'a, [[u8; GSP_PAGE_SIZE]; NUM_PAGES]>);
+struct LogBuffer<'a, const NUM_PAGES: usize> {
+    /// Header that a debugfs dump carries ahead of the data, present when the GSP firmware's
+    /// build ID is known.
+    header: Option<LogBufferHeader>,
+    /// The buffer that GSP-RM logs into.
+    buffer: Coherent<'a, [[u8; GSP_PAGE_SIZE]; NUM_PAGES]>,
+}
 
 /// A log buffer at the default size, [`RM_LOG_BUFFER_NUM_PAGES`] pages.
 ///
@@ -127,20 +212,66 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 type SmallLogBuffer<'a> = LogBuffer<'a, 1>;
 
 impl<'a, const NUM_PAGES: usize> LogBuffer<'a, NUM_PAGES> {
-    /// Creates a new `LogBuffer` mapped on `dev`.
-    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
-        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
+    /// Creates a new `LogBuffer` mapped on `dev`, whose debugfs dump opens with `header`.
+    fn new(
+        dev: &'a device::Device<device::Bound>,
+        header: Option<LogBufferHeader>,
+    ) -> Result<Self> {
+        let buffer = Coherent::zeroed(dev, GFP_KERNEL)?;
 
-        let start_addr = obj.0.dma_address();
+        let start_addr = buffer.dma_address();
 
         let pte_view = io_project!(
-            obj.0,
+            buffer,
             [build: 0][build: size_of::<u64>()..][build: ..NUM_PAGES * size_of::<u64>()]
         )
         .try_cast::<PteArray<NUM_PAGES>>()?;
         PteArray::init(pte_view, start_addr)?;
 
-        Ok(obj)
+        Ok(Self { header, buffer })
+    }
+}
+
+impl<const NUM_PAGES: usize> debugfs::BinaryWriter for LogBuffer<'_, NUM_PAGES> {
+    fn write_to_slice(
+        &self,
+        writer: &mut UserSliceWriter,
+        offset: &mut file::Offset,
+    ) -> Result<usize> {
+        if offset.is_negative() {
+            return Err(EINVAL);
+        }
+
+        // An offset too large for a `usize` is past the end of the dump.
+        let Ok(offset_val) = usize::try_from(*offset) else {
+            return Ok(0);
+        };
+
+        let header = self
+            .header
+            .as_ref()
+            .map_or(&[][..], |header| header.as_bytes());
+        let total = header.len() + self.buffer.size();
+        if offset_val >= total {
+            return Ok(0);
+        }
+
+        let count = (total - offset_val).min(writer.len());
+        let mut written = 0;
+
+        // The header comes first, and a read that reaches past it continues in the buffer.
+        if let Some(header_rest) = header.get(offset_val..) {
+            written = header_rest.len().min(count);
+            writer.write_slice(&header_rest[..written])?;
+        }
+        if written < count {
+            let buffer_offset = offset_val + written - header.len();
+            writer.write_dma(&self.buffer, buffer_offset, count - written)?;
+            written = count;
+        }
+
+        *offset += i64::try_from(written)?;
+        Ok(written)
     }
 }
 
@@ -164,15 +295,22 @@ impl<'a> LogBuffers<'a> {
     /// Number of log buffers.
     const COUNT: usize = 6;
 
-    /// Allocates the six log buffers, mapped on `dev`.
-    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+    /// Allocates the six log buffers, mapped on `dev`, and gives each one the dump header for
+    /// the GPU that `spec` describes when `build_id` is known.
+    fn new(
+        dev: &'a device::Device<device::Bound>,
+        spec: Spec,
+        build_id: Option<&BuildId>,
+    ) -> Result<Self> {
+        let header = |task_prefix| build_id.map(|id| LogBufferHeader::new(spec, id, task_prefix));
+
         Ok(Self {
-            loginit: TaskLogBuffer::new(dev)?,
-            logintr: TaskLogBuffer::new(dev)?,
-            logrm: TaskLogBuffer::new(dev)?,
-            logmnoc: TaskLogBuffer::new(dev)?,
-            logroot: SmallLogBuffer::new(dev)?,
-            logrmon: SmallLogBuffer::new(dev)?,
+            loginit: TaskLogBuffer::new(dev, header("INIT"))?,
+            logintr: TaskLogBuffer::new(dev, header("INTR"))?,
+            logrm: TaskLogBuffer::new(dev, header("RM"))?,
+            logmnoc: TaskLogBuffer::new(dev, header("MNOC"))?,
+            logroot: SmallLogBuffer::new(dev, header("ROOT"))?,
+            logrmon: SmallLogBuffer::new(dev, header("RMON"))?,
         })
     }
 
@@ -184,27 +322,27 @@ fn init_arguments(
     ) -> Result {
         libos.init_at(
             0,
-            LibosMemoryRegionInitArgument::new("LOGINIT", &self.loginit.0),
+            LibosMemoryRegionInitArgument::new("LOGINIT", &self.loginit.buffer),
         )?;
         libos.init_at(
             1,
-            LibosMemoryRegionInitArgument::new("LOGINTR", &self.logintr.0),
+            LibosMemoryRegionInitArgument::new("LOGINTR", &self.logintr.buffer),
         )?;
         libos.init_at(
             2,
-            LibosMemoryRegionInitArgument::new("LOGRM", &self.logrm.0),
+            LibosMemoryRegionInitArgument::new("LOGRM", &self.logrm.buffer),
         )?;
         libos.init_at(
             3,
-            LibosMemoryRegionInitArgument::new("LOGMNOC", &self.logmnoc.0),
+            LibosMemoryRegionInitArgument::new("LOGMNOC", &self.logmnoc.buffer),
         )?;
         libos.init_at(
             4,
-            LibosMemoryRegionInitArgument::new("LOGROOT", &self.logroot.0),
+            LibosMemoryRegionInitArgument::new("LOGROOT", &self.logroot.buffer),
         )?;
         libos.init_at(
             5,
-            LibosMemoryRegionInitArgument::new("LOGRMON", &self.logrmon.0),
+            LibosMemoryRegionInitArgument::new("LOGRMON", &self.logrmon.buffer),
         )?;
 
         Ok(())
@@ -212,18 +350,20 @@ fn init_arguments(
 
     /// Exposes each log buffer as a binary file in `dir`, under the lowercase form of its name.
     fn register_debugfs<'data>(&'data self, dir: &debugfs::ScopedDir<'data, '_>) {
-        dir.read_binary_file(c"loginit", &self.loginit.0);
-        dir.read_binary_file(c"logintr", &self.logintr.0);
-        dir.read_binary_file(c"logrm", &self.logrm.0);
-        dir.read_binary_file(c"logmnoc", &self.logmnoc.0);
-        dir.read_binary_file(c"logroot", &self.logroot.0);
-        dir.read_binary_file(c"logrmon", &self.logrmon.0);
+        dir.read_binary_file(c"loginit", &self.loginit);
+        dir.read_binary_file(c"logintr", &self.logintr);
+        dir.read_binary_file(c"logrm", &self.logrm);
+        dir.read_binary_file(c"logmnoc", &self.logmnoc);
+        dir.read_binary_file(c"logroot", &self.logroot);
+        dir.read_binary_file(c"logrmon", &self.logrmon);
     }
 }
 
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp<'gsp> {
+    /// The GSP firmware's TLV.
+    gsp_tlv: firmware::Firmware,
     /// Libos arguments.
     pub(crate) libos: Coherent<'gsp, [LibosMemoryRegionInitArgument]>,
     /// Log buffers, optionally exposed via debugfs.
@@ -242,13 +382,25 @@ impl<'gsp> Gsp<'gsp> {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
     pub(crate) fn new(
         pdev: &'gsp pci::Device<device::Bound>,
+        spec: Spec,
         bar: Bar0<'gsp>,
     ) -> impl PinInit<Self, Error> + 'gsp {
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
-            let log_buffers = LogBuffers::new(dev)?;
+
+            let gsp_tlv = request_tlv(dev, spec.chipset, "gsp")?;
+            let build_id = BuildId::from_tlv(&Tlv::new(gsp_tlv.data())?)
+                .inspect_err(|_| {
+                    dev_warn!(
+                        dev,
+                        "no build ID in the GSP firmware TLV, so its log dumps carry no header\n"
+                    )
+                })
+                .ok();
+            let log_buffers = LogBuffers::new(dev, spec, build_id.as_ref())?;
 
             Ok(try_pin_init!(Self {
+                gsp_tlv,
                 cmdq <- Cmdq::new(dev, bar),
                 rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
                 rmargs: Coherent::init(
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 5da3d134eec7..6f8f330a0297 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -362,7 +362,7 @@ pub(crate) fn boot(
         let dev = pdev.as_ref();
         let hal = super::hal::gsp_hal(chipset);
 
-        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
+        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, &self.gsp_tlv), GFP_KERNEL)?;
 
         let generic_bootloader = hal.generic_bootloader(dev, chipset, gsp_falcon.imem_size())?;
 
-- 
2.55.0

