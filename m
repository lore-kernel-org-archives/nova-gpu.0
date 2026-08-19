Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD2D3C1F57
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111565; cv=fail; b=aE2D7doEs5PssdfK7K0Xen3mXcnqSpSXcwAi2/XajEwtWyAih5RnKcdvslIs3bIsSXxQng1G2I/Q1Wjt5f+Ux5WfTyz+JT0olaMfM0GYK8pgD+3SKO+Nn0ogBiw5gZFpWdaYeL7/KdyzsXcT+zhxHn+zHK+TMDcDqrkKZUjg4ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111565; c=relaxed/simple;
	bh=nXlz0mLapkvkTn8GxJECbqJQjlW3UMvvhsKNdMGQCwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OSqwBDzfW1mFuTykos9o+y88V0c99RynmSW3ra15+5HDb2p0s1bcIxON3J8/inEMqdUAob/WC7nVGm4VUHt5Um83ohFJUczj35JPjK6Kqre7+Z8zGiBAGQXodKmwtcV6bm2gEiCiCw//HYrJ77D/K9KbfDbBZD0em2eU9IBXtMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n8BxHpHu; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n8BxHpHu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgnwHn4mzkS7W0AqbbvasvqzFx3N7YJjI3OZZNNpHnBa4meYdcSvLNuLZHob8PQdJ6CHMdKCzRMM8z710tWqggACdbhjYJyp1iBiOFKEBsp1C/QnQbtyAHdw2dZLOwaA9azQqflvX682PlbmqoYua+PEhyjX1a+QDeOTZlROUmSHC2hG0t/I7036CHG4dKlt3gM3hiMdJdxqeRNq7AJvLUcvqNac5pxXYTewmbHzH4lrUAOjObxo5AGF4hEvLBh1XFQoUW8LxLPnLzRgr8jclGX66vgniQvBly4SGWKJDbTaY597CzjATwNQ2s4K9WOHQNYH4ZFvAyaM83gJwtLMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+UVQgZQmF79dGvQo0Mn3T/LuqmkDweuHheZs6f4gL4=;
 b=hblCcLj8z/bQ/FW87DHLCXkDbJ0pWd93g3WJb2ODwDXkt6Z+VcjelWA0InhfRmzKkMMvJd3xH6qTQJxTnwYxGPYvYf4bIJtYvT5X4efmcsO9H/XnhD8CzMfzKBa1oqF9aF1yfzObTQrY+csXj2kqoH/+sNGq7lceB+Fk/M1Zh70UprGzaAdW/+LajieAzXiskMR/qcBfOKU1KXbHmdp2/079/cZAjo7e22W3NzQWBaQJB6m9tw3pCmfj8wN8p5FiCyk/lrdLAON7k9fx6wtNRg1u+ILYVwlRNYjQ4iHce32rX/p4dqfMkySTQpSgOydoyKwutYc9zE28T21V2Ax/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+UVQgZQmF79dGvQo0Mn3T/LuqmkDweuHheZs6f4gL4=;
 b=n8BxHpHuvQluOVGJYcMEg9MTAdfzUpYyhRSY8gOhiy0HYtOaKp2g69EnAqKWc/WBPnAFJcAYUpR56YIBJej79UuqAuA+vyQnYeiQ1KXnvktGxkUB9tBN03TrKn0Sa2RcCrsc1kkxGqqmog3WncqKJWBD6cXtQbz7WmOpPdrZ4W0ldLrcLuP1fh7xI3x3RjBwyHKJx74gWE0gnpsCEfa2wrzmXv0nFVEwo4dymr530pZZOQwj5MtOKNG8sCpJs3w5cxa2W/ehr+8iUBG7ArlB6H9nHtvNtAsRn7KugUO+XvdDesyObqQ0hN9A1UQu3Em+RArRnq+m6Ai9G6vhaU9v+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:31 +0000
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
Subject: [PATCH 07/27] gpu: nova-core: add optional ucodes firmware loading
Date: Tue, 18 Aug 2026 20:52:00 -0700
Message-ID: <20260819035221.336390-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 1303ab49-9298-41e6-8f37-08defda54b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R0algOwSwYpkuYltG2iIOao4NA0N+5r0/wUJXZVO3LH+qxa/38ZUb6rje4HLGcx3fEYYW8WXsaJ2aW6QgC0+6DyOV0sbwKJijSbAoAGKXwmGJLSZ8yZPnHSfhqmkLtSUASMX7vVsqH7N/W2aIHcW69X0K0+lZib55GJ2caDWtJDZnHx/V3WU/wGSElHEpFuVcyc44lnywv1VnWtSJxLGtfj0uWSlhkJgNQFL58EKuRVsB9Vrw3c0pchEhncyVQ+Uax2PcobHFAytoeze/ONm73gow2hRGpvsGg4gqNED7Xyb9OXFqMJw3ySB/ISiWmSPCK9Jw09tw7LWpNmJiV/ovIIIEI6yWFrTYnrFvRk907mio6MgmEutzVRtq2w41OTpA3pSFoA477fmiMRfRf0MJHRb0KxFv1nHrTbI9cMqEE6Pgx4R9nfXUAaUM2MGwZR9+P9/V99YdADJT+5QaFrcIvE152dfOYz7y/7Gj5bpBWOlHAW6rLFRp2uyqWofYTF9C6tkVWjae6Ouxl+8iU+gj5+627ATN9XNsU7HjTZAa8PXJON0AnjRu5SdHoikkYbYdpMeb7WMtPR7/OrboOieejtwN+/Q16mFYGD+uUZpOoqCsRSn9UZMpNaLfCW8d05AfteQj+GUOdtN04xfWB4PDV5fwksC2kqhAsU9sn1lG50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FA0KylhVobv5Mo/hHC7NtyNVwUdzgUeLgkQKL96ZNqTHcdK5mnmfL5G4hBcp?=
 =?us-ascii?Q?kvNitdussVgKfqJpD8BSqP1bBE+kEPAP7OSPnPoDk8NjEOh4uQwAQsNNeGHC?=
 =?us-ascii?Q?XbAxMaY42LrqIvRuZ8lM2F2hyVkIQFfS32xQwrAzxjV7kwYXMBDvd2omIqTo?=
 =?us-ascii?Q?slNlskzjEKg6LAHAyxAhuS94G4DleUFuO28dQ/GyhD7c6Y7AjohxwpIlj2uX?=
 =?us-ascii?Q?r0Jx/yxsNk0lCwUM2XRSBuanE927u10w5DougRMxSpGU6EKU7FkZ5dCpoDbM?=
 =?us-ascii?Q?8wV+2XhexfqgD0UxC5Gk1YMyHGQuv0CdUbNM1cnMm8KNU0dDHpZjCBfBS3qm?=
 =?us-ascii?Q?ebAEfASoDUcFktaRDfwfM4Iwwy91frF605fYMu9GxMJtdKFE1RAgujsrKdKI?=
 =?us-ascii?Q?qmeNSBaleDywLoAemfpImGYktgwotECOwwJxHuTJhTJzGCUNa/vKxFgB5/fp?=
 =?us-ascii?Q?0G2CZ6GAD5iwrvN6dB7///AqWaJboRpWdmjjZn5IzWJ+Cj53sGCaE7lFXII1?=
 =?us-ascii?Q?GCC1mNvY2ECYDmfLCT3K6Lo2dkvzJX8bN5koyWEPeVPV78EYeXnxo9m+FWnw?=
 =?us-ascii?Q?WJ8nf2nXGgxaAC/1c+t7jyCW2rVA4HvMXRUMI3ezYCliA7mTpEFt+MgowmQJ?=
 =?us-ascii?Q?AZF3W2GbQZBrGL6rl7sFV+Ro+uGR4blX7hlMFw+W+J2XaNAizsFBbfWfuGqt?=
 =?us-ascii?Q?6sct4Fxs8qOWvE3WLf2I8oBqsbQcCT+c3BS3p9OTINCinLYrsic+59HrXyaZ?=
 =?us-ascii?Q?1KYh/RpOAHDeVAjIhUgSq4T7NTk8VMMX/0FJrrG8eNgoOt7OqVB2o+l6o8f9?=
 =?us-ascii?Q?aucdyXquyGYLEA4VixRo5H4X0LzGSFZap2p7I4mkXc4AU2Qhj1C5ngBlQSxR?=
 =?us-ascii?Q?Fu5ubo5bSPRX9HFhVCYGkV9izqm/8iCoNwHC9McfLIeqjzAT8iJEvmQ3jKmD?=
 =?us-ascii?Q?tFnfQ/Ao4ddaOFvaN7qmssV9x6I0oGnPESzxuE6Ot7zBgAOZa/GkwHmCm8QG?=
 =?us-ascii?Q?DHWLrbkXZyr/nqHvU3YzEpvrp1Rh5bbF3rD2zZKSt+mc3VigdpNiKBwlzjW6?=
 =?us-ascii?Q?0/vaFFpdsn1DFkLZB3iLOyIkZrrWPegASeJiMxA69Milnk8SWVDjT2mNcNyN?=
 =?us-ascii?Q?0OTHjE7wGR4KMv+D8N2O+nK/1TSEEp1Q3mBVy+De8m5VdmMSsi7WFajbAw9Z?=
 =?us-ascii?Q?EyqDI+abdFWfgqwB8McOymsk+4D+7GCEUbyd8ae83Dm7Xu2e53g+DS/FBdqS?=
 =?us-ascii?Q?oPEoV045pKah2viPerhMPAbmSaSyS8753tauV6kRFClrGJLbUOwo+gEXpXDQ?=
 =?us-ascii?Q?TUtmVwiwLgNzGhlDI5dKF7wyXSvQYzdDH/9Fu6SHxqx7mQeQVjVn5AnLwCOS?=
 =?us-ascii?Q?xac3fRHmSYmMHcIeVb6jq44+GTSTJERPtluCfvldKv8Z4pTHUVAJ2/CK/cYR?=
 =?us-ascii?Q?BDMWSG62UzhoR0eS37f7nuH5SUXYb1bxxPT2rUUXyXkMwjhVupXNLgfDfWaK?=
 =?us-ascii?Q?l0j6FA6rLoKX8VXkVbFOmIONxQVhtxpD1t/Jw2xuNjESteAFHEbvPCdGqumz?=
 =?us-ascii?Q?f/zsLvtKn8I7WUYRZ73N45fsWXkw2bq/gfUO2Wovh4FGr9eC/x1XaF2Tzy1a?=
 =?us-ascii?Q?5fGZWbH1Db/EV2Vy4RItPj2Q03nSRbIz51Y4NgkOhOwEWFHHbmaJYzSXFmJF?=
 =?us-ascii?Q?NP7+2pX+zZaTt+f2HTGTuyhi2p42aOBYOdhEY7z7vc+Xn+HaS6T9N1KdhSsi?=
 =?us-ascii?Q?0NYMePWNJw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1303ab49-9298-41e6-8f37-08defda54b6c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:31.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9dtvmGky6DUyhn5+jtUjef7yuLxhy0FeZpFhjvrZbDeb80hU3tL1IoRBk6ASmCx3SlAUal2gOXzo/sktO/Obw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The new GSP firmware takes an optional ucodes image, a bindata blob of
microcode that GSP-RM loads at runtime. Open RM fetches it for every
chip family except GB10Y and fails firmware load without it, so the
driver will require it too once it boots the new firmware. The helper
added here reports a missing metadata file rather than failing, and
leaves that policy to its caller.

Load the ucodes metadata with the existing TLV request helper, and add
support for the generic TLV payload convention it uses: either an inline
BLOB, or a FILE basename with its SIZE. A FILE tag may only name a
basename in the metadata file's own directory, so one carrying a path
separator, a special directory name, or a control byte is rejected.
Nothing calls this until the driver switches to the new firmware.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs         |  8 +++-
 drivers/gpu/nova-core/firmware/bindata.rs | 38 +++++++++++++++
 drivers/gpu/nova-core/firmware/tlv.rs     | 56 +++++++++++++++++++++++
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/firmware/bindata.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 34657004568c..dfd41364cc77 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -22,6 +22,7 @@
     num::IntoSafeCast, //
 };
 
+pub(crate) mod bindata;
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -348,7 +349,12 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
         let mut this = self
             .make_entry_file(name, "gsp_bootloader.tlv")
             .make_entry_file(name, "gsp.tlv")
-            .make_entry_file(name, "gsp.bin");
+            .make_entry_file(name, "gsp.bin")
+            .make_entry_file(name, "ucodes.tlv")
+            // `ucodes.tlv` may name another safe basename in its FILE tag, but module firmware
+            // metadata cannot describe a runtime-selected filename. Advertise the conventional
+            // filename used by the distributed metadata.
+            .make_entry_file(name, "ucodes.bin");
 
         // Add the firmware files specific to the GSP boot method of `chipset`.
         let boot_files = boot_firmware_files(chipset);
diff --git a/drivers/gpu/nova-core/firmware/bindata.rs b/drivers/gpu/nova-core/firmware/bindata.rs
new file mode 100644
index 000000000000..d9625ab7d738
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/bindata.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP bindata firmware loading.
+
+use kernel::{
+    device,
+    prelude::*, //
+};
+
+use crate::{
+    firmware::tlv::{
+        request_tlv,
+        Tlv, //
+    },
+    gpu::Chipset,
+};
+
+/// Requests the optional `ucodes` bindata metadata and loads its payload.
+///
+/// A missing metadata file is reported as [`None`] so that the eventual caller can decide whether
+/// ucodes are optional for its boot path. Once the metadata has been found, all parse and payload
+/// loading errors, including a missing referenced file, are returned as errors.
+#[expect(dead_code)]
+pub(crate) fn request_ucodes_firmware(
+    dev: &device::Device,
+    chipset: Chipset,
+) -> Result<Option<VVec<u8>>> {
+    let firmware = match request_tlv(dev, chipset, "ucodes") {
+        Ok(firmware) => firmware,
+        Err(e) if e == ENOENT => return Ok(None),
+        Err(e) => return Err(e),
+    };
+
+    let tlv = Tlv::new(firmware.data())?;
+
+    Ok(Some(tlv.load_blob_or_file(dev, chipset)?))
+}
diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
index 7b879f13a61e..b9aabf9ee952 100644
--- a/drivers/gpu/nova-core/firmware/tlv.rs
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -198,6 +198,62 @@ fn iter(&self) -> TlvIter<'_, 'a> {
         self.iter().find(|b| b.tag == *tag).ok_or(EINVAL)
     }
 
+    fn contains(&self, tag: &[u8; 4]) -> bool {
+        self.iter().any(|b| b.tag == *tag)
+    }
+
+    /// Loads the payload described by this TLV into owned memory.
+    ///
+    /// The generic firmware TLV representation is either an inline `BLOB`, or a `FILE` basename
+    /// together with its `SIZE`. Mixing the representations or specifying only half of the file
+    /// representation is invalid. Referenced files are constrained to the metadata file's
+    /// directory.
+    pub(crate) fn load_blob_or_file(
+        &self,
+        dev: &device::Device,
+        chipset: gpu::Chipset,
+    ) -> Result<VVec<u8>> {
+        let has_blob = self.contains(b"BLOB");
+        let has_file = self.contains(b"FILE");
+        let has_size = self.contains(b"SIZE");
+
+        match (has_blob, has_file, has_size) {
+            (true, false, false) => {
+                let blob = self.get_bytes(b"BLOB")?;
+                let mut data = VVec::with_capacity(blob.len(), GFP_KERNEL).map_err(|_| ENOMEM)?;
+                data.extend_from_slice(blob, GFP_KERNEL)?;
+                Ok(data)
+            }
+            (false, true, true) => {
+                let file = self.get_string(b"FILE")?;
+
+                // FILE is a basename relative to the TLV's directory, not an arbitrary firmware
+                // path. Reject path separators, special directory names, NULs and control bytes.
+                if file.is_empty()
+                    || matches!(file, "." | "..")
+                    || file
+                        .bytes()
+                        .any(|b| b == b'/' || b == b'\\' || b.is_ascii_control())
+                {
+                    return Err(EINVAL);
+                }
+
+                let size = usize::from_safe_cast(self.get_u32(b"SIZE")?);
+                if size == 0 {
+                    return Err(EINVAL); // TODO: Use ENODATA once available.
+                }
+
+                let mut data = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
+                let chip_name = chipset.name();
+                let path = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{file}"))?;
+                firmware::request_into_buf(&path, dev, data.as_mut_slice())?;
+
+                Ok(data)
+            }
+            _ => Err(EINVAL),
+        }
+    }
+
     /// Return a slice of bytes.
     ///
     /// Returns `EINVAL` if the value is empty.
-- 
2.55.0

