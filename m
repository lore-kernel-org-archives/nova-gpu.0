Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61B342C80
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370508; cv=fail; b=j1t9YOPrMoaWKWF0DzSu+yqdrGPY3UKLg3mEuuSQtcJYgSMlabOuzAbt2mnSgxSbR8++WhhxNCnVikNlt8jJtZw09D2Mz7o9YC54YggrWFj6x/eZTwakHaCSnjWMHlVw7ZpA5wLcgETt2bxau7s4OYYnerW4W2u/3ZliJIJWtq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370508; c=relaxed/simple;
	bh=gX3ZRKDRhjJTf/yqeZ7bu7JPPLQIMJuYH+OrwwZQV8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YwWKCrEl14klzNXOhTDwa+3DPV8bjVhytmreSixn4ZcqpBTypkMAP+1bwcncGzZs1gfTbU3NWrzcHJZn9tmTexXd3/0rSkZNMZBcTn2E83P6gCqcYUBY5gPhPo3uuNM7OPAu0NMjYFX+oaaTaHz/xGyL/gHUIRD5NXLMD4WTnBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o6JeYjQG; arc=fail smtp.client-ip=40.93.194.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o6JeYjQG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9MaEe9VJqus5NMiD8zmY+QkcWzLMw2zc/k6Zvqsrj6puqLS51qCNJLv5O1RhsEOFfOMcXs9Op+rhJBRrg4gu1nfVq92FfUIwT3WOQiiYdvbZK7fae3E8xsWzhWMktsJWWBq2ES2fvm/tgRHjLSdeLe1KVh7sCh+uIE12h9S40vuknjclruA/xg/OXI8WsoISP/u43prdVg4m+vp8BXyx7h++piG6YIlPY8VJj8fyUHATCzYXgtp+03IECXUe12ujyyhEkjLCfyPacW4PQkzACv2iIezpYD+wHMso8YWF7pTEbuxEZRVv3awi4KDOwxDVHkUfBRnC1M/aM07XWa7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8veI0sn7nGvSVaL820Au6SL2rMDeFEkkNwJUUX5MbEo=;
 b=Nx8ZinmmdkH1hr/PxooYM+l8wBDhT7Jd/t0WlHdGSBOJ7cBPxz/Ikv2Fhie1Q+ZKC7+f5cuX9k815l/8KNc/bQhdfpzrtLr4YW+G0VB2ggs1nzfZcmFgGWTrVP553FBbEk3PO4vOg/GPUw8iIAVVxywVGnfDMy0QzcohNDCw2dwaHprBY0COKn8FVFVcKfkRGYHLFzezk7rgP7mwrkIb709nNCrXIYh4VtrRPtheH6FDUIGEtPPYtW9IV6KZH+UmaX6yJ366cbnlP/gQbwSenVOiSHAejqpdKWN7LxnEmD5LMSj5jrIIjrQjNlEN0FvIj1BOMv/VxNkzwXqC4hZ1vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8veI0sn7nGvSVaL820Au6SL2rMDeFEkkNwJUUX5MbEo=;
 b=o6JeYjQGRg1ZnO2jnSVE9QOr2mmLPGxjEFp0xp0pIzmLxV9CLw/B86zEK8i3fg5EYzLmajf9mwlqY5nOuuFbmlEbJmEKuku7s/r4IAkCTmIy5UlGk0BQLsTefvpwZx2ydAzuFOMuImC7HjuOyqQY6Y/ksHMaOw+6IPWG5mlk2GY3LZae0ELKQuSX6ECF8irI0IQKw1oDEe+msyLkFMmaV+DW2TIfeSKprGPVjlRSSJ77RW5328SnEfpbn2qFjD4QGrNXUD05ayJKQM9uVlkQ8gfIgdIULKSKQcottMW0yKPqISigPm540bkkKvy+AVLQw76iCkMNK5dIqdbJelnpDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:34 +0000
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
Subject: [PATCH v12 16/22] gpu: nova-core: add MCTP/NVDM protocol types for firmware communication
Date: Mon,  1 Jun 2026 20:21:04 -0700
Message-ID: <20260602032111.224790-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f8e849-e7f6-4b26-a877-08dec0560c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|56012099006|3023799007|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	jpKyBIfppljHpzZ8fwz6tWK9J6ESwKuCuXXhfNcyIFWOgVDWe212Vfj/BFTcYz33XjxQu6z0a7YJQx5s+kPxJPINTNznLhysz/af2fj0goOoo8heqqbPBfZL4A5iXcJG4uyZG6OB4f2zflnDGQTtNU5FR9BAtjAq66te+lEqw4oYoq0XrDlI51CPjelavws+ZIFKDMSaIDJalHP94H47nh6pnvWqkWHoox6aNmPSQTrHtvSriFCsiUk28Z1Xwvow9nvjPHgXH7ay2v36Gs0rNtJ38avAB/emb+Qi9mKJBzyYm12eMtBEtt9TKQadspSzAJgRkcMFco8qGUTKiyyHoAthZKDVZ6kqj5tZaY8SeHl9P99bLuZu646digofagCgqqRIzXK6gyGaFwsFkfnZ8kvK7CbWQHPwR/vq4sThk+jxU64td+D8oXjJpMuXgAAxzDpC6Wn5GRsnZ5dz9om3UwN8+psyJf3CZCeF5NlALSA/69KjNkfdt8FtSGGYczGmZgQeI/cWm2ApexTPH2MfflEvJM3r9hmo55dkzgxe+Gf3BGMil9BrmbGer9CGYip/wTzcL/oS6i50MJmfMi5bLSHFOn8KZPh0pv7Hszqp4vCobhORYOVhGqkzhHTPogAc7YbIrK9sNO5r7xtRIJVropizkMxC6qcrLbG4E9pso/78Ka0lhboVPpGkZcrc8bja
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(56012099006)(3023799007)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IojZ++kOU6eAkSk0E02k8kAKUZdP6haJroUZ0A8OfgyYYCqZgCiz0s0eWQLm?=
 =?us-ascii?Q?eZm9k2CmVlDF74cEs/pMwCk7xhWklCpy7Qh7PQbxtwjPEvGG1wLr09Z5AuSo?=
 =?us-ascii?Q?fy+zqUIJRMMiDNFw83Q32R8rOzQ5VLcvTQNQ8guFZTQDScVswk/DCrBu5L4H?=
 =?us-ascii?Q?bBfSiU3fyeWE8JqrzBUyko+DsKokiAJ+JlVSKNFMPsDKDxc80QfVWSYiGMpd?=
 =?us-ascii?Q?h86NkIzsClFbOipwSiE7R0jENcFfX/ItiXJwABie10I1w1R3yCJqnKH447AQ?=
 =?us-ascii?Q?Lxlf0zMozXyKHOLH7n7PclIESoBvxED3QLKGJR2oCPCtwIjsZM7R/n5xFA4G?=
 =?us-ascii?Q?iw55S3lolhFPvEm6B+gFhIHYc6nC9sfib8O5EIxFHVRdXPBlFC2I/mVooHNz?=
 =?us-ascii?Q?BnMooOV2dMVfboirNT2lnu+qpBq3ULXtt+yA74HDVax4oVBTvB9gkrPA0+Dk?=
 =?us-ascii?Q?BwsyZUl9o46t1GaHGI8itJHPUne0QGHrNfWkCLv85TpyU/Oetn2EXi6xuPCS?=
 =?us-ascii?Q?z9+7c+G0llRICoj/TEbyeVOoubS1t6PQ4Ox8M88k2PCyzz39Elm8FFg5dt1a?=
 =?us-ascii?Q?2DiRpqsN8a/Zt+1AES+xkTVv3GwCjABMM9wfUfvr0BqhJQf7e4NQZ4VDz9SC?=
 =?us-ascii?Q?xbC9+NpKbcr3RIC9S3Zdl7iNP8feGg1exiz3CY/Hl0Eb1365lSEvzffJVO66?=
 =?us-ascii?Q?v1v5OBCogShhTHiU/QuYB60Aqi8OSAk/znZu8GB2CGRyMne/Cyp/q9ImAshP?=
 =?us-ascii?Q?ZOdEz+s7s1iHNRPwYSEGr7MEQBnNX/G84cNa1Vh5C3+vRCC/QTpCVEXHHh3w?=
 =?us-ascii?Q?Dm7Gw2LNyxpiE265Hfe/LkZWWjSIIlqO3wMXbhvz+0phOLIjal6O8+u0W7l7?=
 =?us-ascii?Q?LZAGz7Zp9U9xl0FzqtGYnR1qs5VjPmI25jEt5aYAhNiWdre9fuC4JrQH3MOE?=
 =?us-ascii?Q?4vKQDMNEjgzaRnRVz8QNzhxIwy+l02P6E3AnUmUKEwbTxEvcm5CgrfZqfBUM?=
 =?us-ascii?Q?hKXLKVLrHdjBCy1f4pgdZae+PLoFiMh7F5b6umMTD0OIYTyNOliE3xB6/d2s?=
 =?us-ascii?Q?4m46P1oeVKamxptu6t+6NL8BKn1MtbF26KuJ/ifTt3hzXJ1Yh18fPHJjnyHe?=
 =?us-ascii?Q?VIC6eOZGK/2mq2lnIWQaBepwUtaNrfsssyABrlAgjKzf7uam3qG+800cwILu?=
 =?us-ascii?Q?j1tOkPlVUh2FxtTT2pJqCvRd5Gbbx9w2o4fBAOs8/jhlsQePZOxabgqOjbcy?=
 =?us-ascii?Q?7YZNERnOiN0UAJbnWznBJZaZofeIDH+fop78xMq8i+3aDksmPovAR6qW4DPg?=
 =?us-ascii?Q?j12kDdOLDgT7lK10oJD7AO9eQGT/OMH2AMwKtgsl2Fa+nk+b2x7FcXFpMu5/?=
 =?us-ascii?Q?/hm5vQ9az90ERFTUOEj+4mC1r7VxEMCNWqyGzqPMeew8SJb/z+ccPPpiSZJn?=
 =?us-ascii?Q?NSr1qFb3zPtv3mkqqgVL7Sxp9tS3sGFNwRX594HJVGEl4SOZ7oAI2RmyIxOS?=
 =?us-ascii?Q?GY8vSTzJAcuT2vL3b/Nfz7rzmuo4IstMSNsYsNiqvvn8AU+zRiJj8uDlchcS?=
 =?us-ascii?Q?sxFbZGfgzIgMuvE3DZZvg1rMV7qd9Q1qIK+z8wT9Y7lHekG1X39pAcXFGdD0?=
 =?us-ascii?Q?EVes707/z/ySBfzk+ChTTDBZXMjqF2r/p/n/e5rqyPnj2+raarC+AQiGDOm7?=
 =?us-ascii?Q?bMrf5pmx+tOiVE+HE+Zl1JXhgcqmh3eLapKSff4EJBvsBwtPsiFUdad9vsAx?=
 =?us-ascii?Q?MYOcCMGOIA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f8e849-e7f6-4b26-a877-08dec0560c50
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:34.1175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pZ7CW+QzxBz6ccjz58szcgIGLStQI4PfQ/9xBQsoN8zGR/S7bCyy+M1dQewAZJXmBoyLM3McpscLJlFeLM4EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
Device Management) wire-format types used for communication between the
kernel driver and GPU firmware processors.

This includes typed MCTP transport headers, NVDM message headers, and
NVDM message type identifiers. Both the FSP boot path and the upcoming
GSP RPC message queue share this protocol layer.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/mctp.rs      | 102 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mctp.rs

diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
new file mode 100644
index 000000000000..a13146dc0cca
--- /dev/null
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! MCTP/NVDM protocol types for NVIDIA GPU firmware communication.
+//!
+//! MCTP (Management Component Transport Protocol) carries NVDM (NVIDIA
+//! Device Management) messages between the kernel driver and GPU firmware
+//! processors such as FSP and GSP.
+
+#![expect(dead_code)]
+
+use kernel::pci::Vendor;
+
+/// NVDM message type identifiers carried over MCTP.
+#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
+#[repr(u8)]
+pub(crate) enum NvdmType {
+    #[default]
+    /// Chain of Trust boot message.
+    Cot = 0x14,
+    /// FSP command response.
+    FspResponse = 0x15,
+}
+
+impl TryFrom<u8> for NvdmType {
+    type Error = u8;
+
+    fn try_from(value: u8) -> Result<Self, Self::Error> {
+        match value {
+            x if x == u8::from(Self::Cot) => Ok(Self::Cot),
+            x if x == u8::from(Self::FspResponse) => Ok(Self::FspResponse),
+            _ => Err(value),
+        }
+    }
+}
+
+impl From<NvdmType> for u8 {
+    fn from(value: NvdmType) -> Self {
+        value as u8
+    }
+}
+
+bitfield! {
+    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVIDIA firmware messages." {
+        31:31 som as bool, "Start-of-message bit.";
+        30:30 eom as bool, "End-of-message bit.";
+        29:28 seq as u8, "Packet sequence number.";
+        23:16 seid as u8, "Source endpoint ID.";
+    }
+}
+
+impl MctpHeader {
+    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`, `SEQ=0`, `SEID=0`).
+    pub(crate) fn single_packet() -> Self {
+        Self::default().set_som(true).set_eom(true)
+    }
+
+    /// Returns whether this is a complete single-packet message (`SOM=1` and `EOM=1`).
+    pub(crate) fn is_single_packet(self) -> bool {
+        self.som() && self.eom()
+    }
+}
+
+impl From<u32> for MctpHeader {
+    fn from(raw: u32) -> Self {
+        Self(raw)
+    }
+}
+
+/// MCTP message type for PCI vendor-defined messages.
+const MSG_TYPE_VENDOR_PCI: u8 = 0x7e;
+
+bitfield! {
+    pub(crate) struct NvdmHeader(u32), "NVIDIA Vendor-Defined Message header over MCTP." {
+        31:24 nvdm_type as u8 ?=> NvdmType, "NVDM message type.";
+        23:8 vendor_id as u16, "PCI vendor ID.";
+        6:0 msg_type as u8, "MCTP vendor-defined message type.";
+    }
+}
+
+impl NvdmHeader {
+    /// Builds an NVDM header for the given message type.
+    pub(crate) fn new(nvdm_type: NvdmType) -> Self {
+        Self::default()
+            .set_msg_type(MSG_TYPE_VENDOR_PCI)
+            .set_vendor_id(Vendor::NVIDIA.as_raw())
+            .set_nvdm_type(nvdm_type)
+    }
+
+    /// Validates this header against the expected NVIDIA NVDM format and type.
+    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+        self.msg_type() == MSG_TYPE_VENDOR_PCI
+            && self.vendor_id() == Vendor::NVIDIA.as_raw()
+            && matches!(self.nvdm_type(), Ok(nvdm_type) if nvdm_type == expected_type)
+    }
+}
+
+impl From<u32> for NvdmHeader {
+    fn from(raw: u32) -> Self {
+        Self(raw)
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 7b6c331da10e..9f0199f7b38c 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -20,6 +20,7 @@
 mod fsp;
 mod gpu;
 mod gsp;
+mod mctp;
 #[macro_use]
 mod num;
 mod regs;
-- 
2.54.0

