Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C1236DA15
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370514; cv=fail; b=c5hNa/QGu1EULG11oNw09EWSKZJp7hxgAWsm+81b/n1u+eNiMrdkeLUV02SB/otjsLq4R4V+EjZnNhDaUHX0v48Wa/kEDAgTH3WQj1QzkPz+87U6cb4uiRI0JC36SNacWJp42x/gK8c06VHPkvXhCe/TBHatQPttbc4pFbItVc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370514; c=relaxed/simple;
	bh=AYGb21TkCTe4aAKJXoJRwQCskZq1qmEUVwlKP47P6gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OhXMIrzITRnTHopZuQ1tE0W4fLxtn15tgaF8UqBibaEc8CKbtOul/rqWWZjxnzYnRHD8KC00/zfq1zHNTb0V/hcoQ9blouv81ZU74UrM+mYDWJMlLq6T3iHe0YxjvGA+w9ShORfNnecHytElkjLJI4MG5Upq7bPZ8uvWgw7Uevg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=obCyYrRj; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="obCyYrRj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hn+v1di+tJTv1GYkfqHUVm0CR9pz3NjN4T+OHxSD8zREg4jVMlfS8w82blW1o9tqqsJPA2ffDlmdHzAJR1IOYocwnTfc+BrLdTAWKfn8TGf2h6hesOrd21VMurr96I/8+Xaxi6ph9bNDMNEcrFM44fBJHUWFv5V0bccemXq1+VBwWVzLXIRzb1zSKPH18UoNrvdUk3+PjcKkcF0eBaCytoHFbPas9JZwBYWl3YWS+sl/oiIDejwtxozE0CY1hEsasFuo3HOmyBYb6gqfV2ce76hs5AEZY9w7RbR+LR8trsWf0zSYyziaOuDF0GLx2o3Q01ELih8LaW2zoh38Smf1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7jyVdYlBj+Gck6lWqoB+0OnTJYP73CXR6jh7lD3G/Y=;
 b=m9yla89MLD4CgIO6i7PCkUH1sJZir9XtlX3CgHSrQr0JBw4byghUJOutgfLUNsrvEn7HQgXtJExqei7veg2XycPseHow7JgpesHKVzItR4LTSME0OwiEyoiuBvMO9eEoo9CC+A30GgJSG87qRigeJhnWbBSD45kFqgU4BakT20mOczYQPYyTmu1Ns01zj+Aj/GBt0OKJObR5tZgTUj4bwmJatwvArNx/vCDFOGtJmRuWVFLSY/qySsnmyBavle0H9DcWXYSIAQeuaH+Vyf/NBqrWIoakygD6lVvwHa8iSuXyU6iJikh48F23TN4Bh6gswI0It04qQb/KE/ov0Zk40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7jyVdYlBj+Gck6lWqoB+0OnTJYP73CXR6jh7lD3G/Y=;
 b=obCyYrRjdCQNEPT6Z3ONPMICqR4F9Kefb3iya2BmZpF8mFVD5gr1y2tpTirtsRnjP/nnYqAm2zl8KVez8dllyevk202fZE8J8RjEqngh6FoKKGFJqem6Ia7U+yLDW66InHi1bn9rEy1fJXjGXePm5nMeV16ZUwqau98LgNYuasP7qsum+DTnXP2kRoqP1xrv306smAMf9CG1am7DkL/448cdHwIjW252ydRIYSIQE8dDHuUBVrCb28SR7KYwDP9B4leR6C4ZalkGgRQCxrVnrLRDwxdB71lBOriUC9dHzxYOCxhaq0cRRf4SFb4HFnPUCv+3YT31LhxzADOEO6WcIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:30 +0000
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
Subject: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Mon,  1 Jun 2026 20:21:01 -0700
Message-ID: <20260602032111.224790-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: c163f49d-4358-4dad-80cc-08dec05609e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	9cI33q82tCQ8tkwVDfW7feUNAU8c/niZv3IoWDyiKbIHrmboqW0XFjReHx8WJYOMHXS7WdPLBMraqX67TfjCAq6Rlpznd35k6/VZNRpec4S8OST+lPrpBgz9G56TzmyGee7V7+mlnEcSk01fwUFpe2mtExZNTe9/eZbG5F+/hZnEP3L/rhTEueMadYgmL8i13L+HgKd6etbr3ffJpreYhio97kEAtLDMkPiiXQmK/QPFNPh21cZDFbbtN2BL4hhpHe0gIC1lPKJCTQ336iROiMOeMYIJ2B5OcHziGSoLxS1LS9BpD7x7YLY83W+JrqVP48uvS+pixPEFfzmGQKvLhElsT4Y3LCYNQM3nv869Tgl+ErOHz/Y9cV+GS/DmbFphraqHo11ob63K2kxHy53ph4+AP4ivSSnVMhFtnE054+nYXN5/kd/YQxnaRRUyozW4xpMiu0WAsRXW1wJ2tvvLrqr61Mv/WYAn+p8Q2NMFhJ9sxx5lnu2cnqayXQmUNLnLxr+QAoouhKhv1hKl8vbUNgwN91nytbpqDA2KRqx3XgN+ukdMyvaoY0YLx//Rqs6funAfW1SnTiSLkZH+jJf7JBw4lpujQm7Ye2Gj92JNXpOwbH8wgf490wYLkzbZ4IozDQ0X/eFD2nwHkmc51xsKL5QEX0SH9NAlMDJfQMT6Il8tWnXxIBql/dV9KmkGdH+P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GCoy/+og1q9/1ifvpIECapbjBHZuqoo8RiKOaiu8WVHcKQz+Cd/RSvRjvmNn?=
 =?us-ascii?Q?F5vOP+GZ0lt7T7ddoFpWTxkF+vvDgpaU+H+LC2gJPSIwfmeZ32wxTKe1O0yh?=
 =?us-ascii?Q?K+EXQ+21PDCL7COHSYYWg96KXx1ImrkjhuYNApAIm7kMPMW+Ppr3uVOBSpob?=
 =?us-ascii?Q?wwQQsSUHIoIXDI2/cPweQ346tIc69UnZWl2HTEZhz/jsuHvrZ/6JsCDn40j1?=
 =?us-ascii?Q?ZHw+8V0HZ42swZbYeMHAbIGdM4qb2K6K4hDr6/i4PX7KEHmhPc9LEBVeTbrq?=
 =?us-ascii?Q?yrbDDh+aGompgFr7ct9kqklddYBQcJ0JSM6mss2nGuHTGd08yI3tuJGO4hsk?=
 =?us-ascii?Q?QPFztHOMEXUmNZc+2anZhwN1dxswWIUqKiMJ+zA/IMzAYlxYaPZuXYS/zJ43?=
 =?us-ascii?Q?XyhRSmSMGHBMhPC5/P+JFlHyoB/2kmFuncAWrvhO0kMgJmBcN76B5VQ0Wg3I?=
 =?us-ascii?Q?PZii1ed0WBYKZAdca7ltUmpN47p4H1/oT3W3ZA5wfyVRdsvftfipk1G8ichz?=
 =?us-ascii?Q?zP1gVe5hxeWYWYkS4htvOa8jCS4TKgHc4DVzgkrhlLFIbZFEc13mkQ5ygcq6?=
 =?us-ascii?Q?TqLXAOOwlPvDcAKgkLXInZ6we36nEDXoQuX9asEY14fla/yjKag2NbqqHzXw?=
 =?us-ascii?Q?yW+UYRgQiSaiIhfEUxOv+RoYjZ43crE69eGesNMC+TsNGCQ69CtY0tAtqWeU?=
 =?us-ascii?Q?c21rncA7FmXkG8EkHYL54ckA3oCU3RobkJMxqtO7qQWaXP8YS/npNOBGGArv?=
 =?us-ascii?Q?9/pYvWhWqMoTrsI7QYF0FP1m1dyQwpuDLt6hlCnQYEOphm8VlcIssun7BkmE?=
 =?us-ascii?Q?uq906C7jjQix4zYn6n2YU2aAQJ/0hmIUKGE3RxCuHA99Si83LrPcWVV6xNjo?=
 =?us-ascii?Q?UsQqK2NvPszmCaROuzMFtZglpU9TdV5CqQV184UX8aWIHS2bjtoxT0r7EaKE?=
 =?us-ascii?Q?UumgMFV5XrQt+VQitTyJFviVAuEkj0vDH8TJ2FN2437seTlII/BGE4dUuua+?=
 =?us-ascii?Q?7xWkm3oxo5DhWMpihWOf4EYCIYI2KQ+o5Wlb6KJA4CVPL7iUzEZk1d7jPQWl?=
 =?us-ascii?Q?v9JI0gbO+4QECzqkrra8823gswVbwc5tKT5S22GJyauNdAMJ1fwihZf3K5Ds?=
 =?us-ascii?Q?QxuJhd2cbv51sHrZd0KqYa3Un0nAxK8rdCk/8SphRWQvRNwqoE675TFKrXws?=
 =?us-ascii?Q?TyGFR13L5VL0H8/kEOZoQ4np6lIybydxdH7REaW1/O0ItYs+DyspKD0akPe0?=
 =?us-ascii?Q?nd0+EWhfUMuQFIfw5q9StQaGdz4qtN5h1pg//7T96gw47qBosbZQpVeVFMjW?=
 =?us-ascii?Q?UPqfOdgnKZkFjrSErbgVc07E4/Vui9idNzoAuM+sHhILJkguzPHyuTNGetY1?=
 =?us-ascii?Q?6zIHks24S0L1DCWJenobV3klsUtDghxcP1LINSpIjEHDH12AcL1NxmSEON46?=
 =?us-ascii?Q?ZUsuO6L20uaXyloFY6e7IWOabh7wP0+sx+cIlB1vqKZ3uu7aP+Ua9l53la0E?=
 =?us-ascii?Q?FEwtMJ/V66zG5t0XhnICh9ss4FVoLeYNYkDvjPlB4a7r2m0onNf3sAVXWAuI?=
 =?us-ascii?Q?cX9DIcgsXyW4H1eBE9tW8vwwlyTpOPSJEtwSde6WmACSwvjEjTEUDrQgNBkq?=
 =?us-ascii?Q?vGwLlzh+H0Odwt104C0OPApUifgrAavSZhdvSBN7JUiOIJ7MoGq9t1Au3GC1?=
 =?us-ascii?Q?320HvpQQz/WR50piffXZDq1X8Q+r22w5GHySW9+VlWUBTfQHkUktPGcHF2Dr?=
 =?us-ascii?Q?LbzZXRGZ4w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c163f49d-4358-4dad-80cc-08dec05609e0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:29.9835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGtvSAQOTXBE74/tiVpPKT9gmqsgQzi/J+iCmyY8igb3zv8daxWLZWgL78UD++skkhQD9bm17jRlUAQVHnM/pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Extract the SHA-384 hash, RSA public key, and RSA signature from the
FMC ELF32 firmware sections. FSP Chain of Trust verification needs
these to validate the FMC image during boot.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs | 94 ++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 011be1e571c2..db61905eac9d 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -15,13 +15,35 @@
     gpu::Chipset, //
 };
 
+/// Size of the FSP SHA-384 hash, in bytes.
+const FSP_HASH_SIZE: usize = 48;
+/// Maximum size of the FSP public key (RSA-3072), in bytes.
+///
+/// The FMC ELF `publickey` section may be shorter, so the remaining bytes are zero-padded.
+const FSP_PKEY_SIZE: usize = 384;
+/// Maximum size of the FSP signature (RSA-3072), in bytes.
+///
+/// The FMC ELF `signature` section may be shorter, so the remaining bytes are zero-padded.
+const FSP_SIG_SIZE: usize = 384;
+
+/// Structure to hold FMC signatures.
+///
+/// C representation is used because this type is used for communication with the FSP.
+#[derive(Debug, Clone, Copy)]
+#[repr(C)]
+pub(crate) struct FmcSignatures {
+    pub(crate) hash384: [u8; FSP_HASH_SIZE],
+    pub(crate) public_key: [u8; FSP_PKEY_SIZE],
+    pub(crate) signature: [u8; FSP_SIG_SIZE],
+}
+
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
     #[expect(dead_code)]
     pub(crate) fmc_image: Coherent<[u8]>,
-    /// Full FMC ELF for signature extraction.
+    /// FMC firmware signatures.
     #[expect(dead_code)]
-    pub(crate) fmc_elf: Firmware,
+    pub(crate) fmc_sigs: KBox<FmcSignatures>,
 }
 
 impl FspFirmware {
@@ -41,7 +63,73 @@ pub(crate) fn new(
 
         Ok(Self {
             fmc_image,
-            fmc_elf: fw,
+            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
         })
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
+    fn extract_fmc_signatures(
+        fmc_fw: &Firmware,
+        dev: &device::Device,
+    ) -> Result<KBox<FmcSignatures>> {
+        let get_section = |name: &str, max_len: usize| {
+            elf::elf_section(fmc_fw.data(), name)
+                .ok_or(EINVAL)
+                .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{}' section\n", name))
+                .and_then(|section| {
+                    if section.len() > max_len {
+                        dev_err!(
+                            dev,
+                            "FMC {} section size {} > maximum {}\n",
+                            name,
+                            section.len(),
+                            max_len
+                        );
+                        Err(EINVAL)
+                    } else {
+                        Ok(section)
+                    }
+                })
+        };
+
+        let hash_section = get_section("hash", FSP_HASH_SIZE)?;
+        let pkey_section = get_section("publickey", FSP_PKEY_SIZE)?;
+        let sig_section = get_section("signature", FSP_SIG_SIZE)?;
+
+        // The hash section is a SHA-384 output: it must be exactly FSP_HASH_SIZE bytes.
+        if hash_section.len() != FSP_HASH_SIZE {
+            dev_err!(
+                dev,
+                "FMC hash section size {} != expected {}\n",
+                hash_section.len(),
+                FSP_HASH_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        // Initialize the signatures in place to avoid building the large `FmcSignatures` on the
+        // stack, then fill each section from the firmware.
+        let signatures = KBox::init(
+            init!(FmcSignatures {
+                hash384: [0; _],
+                public_key: [0; _],
+                signature: [0; _],
+            })
+            .chain(|sigs| {
+                // PANIC: src and dst lengths are both FSP_HASH_SIZE (verified above).
+                sigs.hash384.copy_from_slice(hash_section);
+                // PANIC: dst is sliced to src.len(); src.len() <= FSP_PKEY_SIZE per `get_section`.
+                sigs.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
+                // PANIC: dst is sliced to src.len(); src.len() <= FSP_SIG_SIZE per `get_section`.
+                sigs.signature[..sig_section.len()].copy_from_slice(sig_section);
+                Ok(())
+            }),
+            GFP_KERNEL,
+        )?;
+
+        Ok(signatures)
+    }
 }
-- 
2.54.0

