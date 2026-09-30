Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DA835F19D
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739788; cv=fail; b=WTQnY2GzogT6ySeACeNKHRAVuvOdg1z3bYjgL+wzxUqQqikoHFptBIEf7xRCx2MZOJqvCNp1qBnkY0MpMxIjoABvZc7XrXi7xZcZqhIQckRKy8gVba1GSpAW7vSMyy6l0v5GAORRkVTCI+RFdpl7ddXC/JzqBxkgjQb5BVHDDvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739788; c=relaxed/simple;
	bh=U1H1eXBO2fPqW3l4S8DTyPmoxfGXqzEBv9PfLdbHbSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FJlCzRMe6o7NhUwL06G8lHzXgvUpb72TWWzYB0300Bun60rPWTZrU5fj3DqCm/2aSopGaAY2gjud4neUtt3tuDFR+JDgJwGtCde8ZfLQXL8UixVn3jmCXk9nWNGS3m5doe1a6Aj4dN7UhwWkg6ZzEwNlEwOUg3k9P+B4FOCpEP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LJ2GbZrz; arc=fail smtp.client-ip=40.93.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LJ2GbZrz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfbYGQtGVvOqkSedCGK7FKF4LvCLl+AOnOZrucLIXWngzqb0BPhm/op7X1kDXmWq+UjUbASYhXdNLKchmTmFc5RDVu6ZOXS9qTFeMEQDRJVARLWKa3vcwzNn+5F2jsR2SpK5Xeioqc0f43nJ9J+h1d0ioZgtjx3si0NMz4JlWE9yy8cUymNygo9qdwNVg4/P+1y8PDh47daoCH1RtpEXZNJz2T3jE+ohfxZxBuxhnMJ4cEb/g0dHTn5nMcJUAm0lMcI3FS0SbzrrO435fZ0ady7PMqC+xH13ntr9lBnHM7UZ6i2ur+nRCXkmRH2/z/WpPBtzqySJL/kdLKx+cViIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVGHRP6wSp407Ez7F7kaF2WIcP7joVnbci5HQFdYS3k=;
 b=fpWXqzxCPnQZUcgB61VZdsGnvoNgwfaE6Hxjuof9f6Tw+PsbpvUkIWCmxathivzgKS6B9VAOkxkzk7GEp+yqJyPIg9npJ40evMcsDF2bjCDxipQaAFWRMHHJos5bpDVA/DnU/FYfFPSlpWIPkoo3i4KwVJx9u7VM2RcCsjhcAEnnfJkuXlT0e13Rgc42JSkyICIfCa0aLCj/6jozqINTANkoSm4fpcbtKTDX23cIkca5EbRs+c663Xf/F3GpBIb6q4/GozPG1mf7yZQ0F8wO4DE+5cZwDVWE9bFevZp5T8mDmH8b+cUXY8i7mn8FJksg7EgZWEaUMXjg5louC3xP9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVGHRP6wSp407Ez7F7kaF2WIcP7joVnbci5HQFdYS3k=;
 b=LJ2GbZrzXATk2HamdZ3yNUP8F8/jusL4XRRDILsgqd4qvD1tjouNJUSa5638QJ1FRO9oF2mQLLbbkG8J7cSWOjo5v89W3pwEb+rLiZi2ePxrYaL1D4jmh0+3lhV0BNB/yoOpFIWGRemt/a1u+/+6xGMI91jzMAmGwMekoZxVCJ9f5wb/ktAw8Ge4n+q0pyxR9E4Una5QNvabiP7YILXvDDb3uPOdPfJJTm0af54kOQ+i4qhFae4Qh2bQTJ//pQfEcA3W2nMjwryKNxxhriT/hMwLbHs9Y4c2IWe2uswtN5JiyQbQ3vZf+bSX9L1OUKP8gNcaDvnU/TnmRUBaOU38OA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:17 +0000
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
Subject: [PATCH v5 07/15] gpu: nova-core: wait for GFW boot in probe, not in the Gpu constructor
Date: Tue, 29 Sep 2026 20:41:40 -0700
Message-ID: <20260930034148.590687-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 86789135-a92a-4fbf-6720-08df1ea4d325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5t6aPe2grHGlt6VLZXXvOc1oJN9ndjxIfcu6veYue/ws5gOHlktQb7mCwctOvldl8yPKa/GQ9JOEryJJYXCovCO+1QpsWSX6GRWUnsgawy58gTbPgRGts8i+aOtb6UtkmAXWBAAqY0NVq/d3cyhmDw2mdBEKYcLsUfGefpUwP3/gahWx2OPPp3nOEXkM2vT0aZRZg5/Og8Pc6tWUsxYLZTzHYRHyDYgs18XLAn/RtDtgQ9HyV9sZmlGebuOu1oN4ZrYKMDjbm9Scjg8LKp31rF1s6H9qIjGUj79l1nrbsyX7cmnblp8UeC/62FR8DRdIpMLDU39RWG3CPWier3f+l8agWDzqsxPxc7i/RWIoSvMg+al5c7K2pWFfcNZc0A+yqxofrNJy0169J85qFp5LvBYd6wpJoKZBHhJzUvLeQzPVZb6yNg7cU9w6IoCn6TvueZm4C2fA3uve9H8/l73UEHdqP5RMvKBvEfT9YYqjfZ3TsjWl89KWMmjGnvx+JN0jEHJ076nTtr7SYzRKDsspo44H41x+hOYoRds7WXW0wGHvQmaNuFcHJTA6XfbFWsB55U9/yuTAKCOB77nxx5mpU2Db4sI9WFyM9Np7M+H1ZklapMT7JodoIrWRviRpcnPYbgJaWzlh6Idv8eNXKdgH98JKB8zERlZ8aS9Q8YeyAOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J/9OEBxMdRezBptSYpKkVCUK38PQwS4RoKGc2hUlR6SJ6IGBdYm9HZK7k/9P?=
 =?us-ascii?Q?NfJykNt13AT70xN0rSqSWK/nOMZvFXQgxxCcYJRFdYRNgXB1kN8HvhDhW1Ab?=
 =?us-ascii?Q?VhuByOKc56BDCp06rVb00OX5TcEnQt2WlY6AQxFm5IXJ87XzkUSIWBOZ/1T6?=
 =?us-ascii?Q?cwR2epi5TPbEp7zCrJedYaN9oFAQ1wQxfTzx9I1TozklDU/XLNI/k/y0B159?=
 =?us-ascii?Q?ud5hjAtQBKe6goBE3eXANPHtyuXVDmqVTeBf4N/HfPgRfB3q31AzObVqYNt7?=
 =?us-ascii?Q?bsuBfD/360Swpvkxfl9tg5FI+Kx+uA44UhA/mX4QXwXpAPNt2z5+1GoFrpZg?=
 =?us-ascii?Q?AonlF54Hc4zDPBzaOxuyODOxNXR/SvwaCnZqCySn4zl8vWnw2jK/82iyToIG?=
 =?us-ascii?Q?lX7NylmNnXPzYiEXT1/OxyMQ9U6S99ESzosI6K6vml2Nl0P4gWvPOTRhLE2Q?=
 =?us-ascii?Q?3rdUq9WWWk5uoY6BndtxK601mJEeOYb9+Zh2Rk+xDCoRFZxxB14Kw0eHlXjF?=
 =?us-ascii?Q?YbkFnp+wJWFUsSAPfPZA1nv4ipWMz9+oPb0SRIt4hmvMyqBxh+r8Ug5V+Gzt?=
 =?us-ascii?Q?waPL6/YL6NgnqJrFx3F/c8yUZDVxaZdd5rjfRN+i7fDDXykmSXAnqPq2oNQR?=
 =?us-ascii?Q?dDRXHXb/8/hZ+MD7Gbsvvhj96F04IMlsafCzJBI3deP9AC4sOJiOqtQIWjRY?=
 =?us-ascii?Q?Ex9skx2lkSB2OdnzgGK77ePvvKw7RQ1tmNrRakH5cbZBQDit79PzTiRkuLwI?=
 =?us-ascii?Q?hzaRO7c9rrbbpQzfduC+PO8CA4xufSO5bedq9CctI/ptBZdujPaiZBEw9Dza?=
 =?us-ascii?Q?UHTSy3YAjELDiBkCxOL4q6FsTCRFc0RsnzZHO+mip3/i8YQ98FOrUZZf4pym?=
 =?us-ascii?Q?XL8PFMfwAWOWq5WIjoo3jUzRFs+6DYbhRzzwNTkbyyKLmxoi/MiHnbqbC8LX?=
 =?us-ascii?Q?m3Iz56aOxraXMh+O0GlF8wj4QXKg9aO9Sf3E5XFhDBhOP6QubgyOv8mP8Q7O?=
 =?us-ascii?Q?p4cO3+Dh6/p4VMmQJ4wQam/A6feXFkfj9ahTcKUDbGpkPRb3AHQ+WgYCef3E?=
 =?us-ascii?Q?QVmzkpuADX1fbTMUouoYEEAvzMlyHzpWZi6fpCrCEfsqk7buQxI4OGv+SOdx?=
 =?us-ascii?Q?q8uTjc5Lmtf+8nX8o3rDITJfbI60pUTBLfZ6fwnQpUrIMZVsQW603qrJ6pRL?=
 =?us-ascii?Q?Qb/kxfI5JNYlgCzGUcfCX25w8NIttfg8i1yDFyFnZWQR0PBtTTSM1yOTjVm7?=
 =?us-ascii?Q?6wyzhi9RIr2rmO464Nm+NWqqVlj8lvBauWxxOoHL5Is9GO+oxVy1eBXiXo3Q?=
 =?us-ascii?Q?e9w9j5sYIuqvMaBplo03PWK+ydF49km8goiXACiUHlziH030A7KrFKNL7lxP?=
 =?us-ascii?Q?0XJ6wHrGWhoQcxEX8NkAQCLbRTBMs1dRqKtFKlNWXNm5a0tOZv+/SheOXvqq?=
 =?us-ascii?Q?Pxprjcd5Anlutlb/WVOxqHllobA9DVOJOc66f5xFZwgcbtn4SlnmePybva4R?=
 =?us-ascii?Q?NfDW5YkrnGteDBmMYTUS4bZPW59PwKYp9hfEWFM8hslX876YD39QhhDsliFk?=
 =?us-ascii?Q?pf59ZKqr6JUZ4Pp1UP3zUSbwcQDvgMd7WpHg0JcbuPnKiGkWZ9iU6RuLr6IL?=
 =?us-ascii?Q?RQ/f743y19278sy64dVI56p60LpQRwfwQp7oBsA3TIhoIWU+WqVebkzjc5e9?=
 =?us-ascii?Q?Xycxgj2fuIqawZQHSPCU+7rt3wMulabN2u6mZjy+SVnyfQh0BtCIOQzdoNEF?=
 =?us-ascii?Q?M3TjnrkSIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86789135-a92a-4fbf-6720-08df1ea4d325
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:17.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYbhLKO6Ha/1GCb5bG4dPK7S0XlWmH2yBKftHU+UdjF7iDrvrwUBq/Ld7BbxeBOuI7drOx8IqqLWWHQn/Itv6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

The GPU boots its own firmware, GFW, out of reset, and the driver must
not program the GPU until GFW reports completion.

nova-core waited for GFW inside the Gpu constructor, which also boots
the GSP. Code that has to run after GFW and before GSP boot, such as a
probe-time hardware self-test, had nowhere to go.

Move the wait into probe, ahead of the Gpu constructor, and read the
chipset there from a Spec that probe builds itself. Leave the DMA mask
in the constructor, since it programs the host rather than the GPU.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 14 +++++++++++++-
 drivers/gpu/nova-core/gpu.rs    | 26 +++++++++++++++++++-------
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 291a047e4d86..fc321c6a10b0 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -24,7 +24,11 @@
 
 use crate::{
     api::NovaCoreApi,
-    gpu::Gpu, //
+    gpu::{
+        self,
+        Gpu,
+        Spec, //
+    }, //
 };
 
 /// Counter for generating unique auxiliary device IDs.
@@ -113,6 +117,14 @@ fn probe<'bound>(
                 pdev.iomap_region(bar1_idx, c"nova-core/bar1")?
             },
 
+            _: {
+                let spec = Spec::new(pdev.as_ref(), bar)?;
+
+                // We must wait for GFW_BOOT completion before doing any significant setup on
+                // the GPU.
+                gpu::wait_gfw_boot_completion(pdev.as_ref(), bar, spec.chipset)?;
+            },
+
             // TODO: Use self-referential pin-init syntax once available.
             gpu <- Gpu::new(
                 pdev,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index fb6f8a86a503..65715f906030 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -251,7 +251,7 @@ pub struct Spec {
 }
 
 impl Spec {
-    fn new(dev: &device::Device, bar: Bar0<'_>) -> Result<Spec> {
+    pub(crate) fn new(dev: &device::Device, bar: Bar0<'_>) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -397,10 +397,8 @@ pub(crate) fn new<'a>(
                 dev_info!(dev,"NVIDIA ({})\n", spec);
             })?,
 
-            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
-                let hal = hal::gpu_hal(spec.chipset);
-                let dma_mask = hal.dma_mask();
+                let dma_mask = hal::gpu_hal(spec.chipset).dma_mask();
 
                 // SAFETY: `Gpu` owns all DMA allocations for this device, and we are
                 // still constructing it, so no concurrent DMA allocations can exist.
@@ -412,9 +410,6 @@ pub(crate) fn new<'a>(
                 // SAFETY: `Gpu` owns all DMA allocations for this device, and we are
                 // still constructing it, so no concurrent DMA allocations can exist.
                 unsafe { pdev.dma_set_max_seg_size(u32::MAX) };
-
-                hal.wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))?;
             },
 
             // Initialize this early because `gsp_resources` depends on it.
@@ -533,6 +528,23 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
     }
 }
 
+/// Waits for GFW, the GPU's boot firmware, to report completion.
+///
+/// The driver must not program the GPU before then.
+///
+/// # Errors
+///
+/// `ETIMEDOUT` if GFW does not report completion in time.
+pub(crate) fn wait_gfw_boot_completion(
+    dev: &device::Device<device::Bound>,
+    bar: Bar0<'_>,
+    chipset: Chipset,
+) -> Result {
+    hal::gpu_hal(chipset)
+        .wait_gfw_boot_completion(bar)
+        .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))
+}
+
 /// Reads the boot0 register and returns its raw value.
 pub(crate) fn boot_0_raw(bar: Bar0<'_>) -> u32 {
     bar.read(regs::NV_PMC_BOOT_0).into_raw()
-- 
2.55.0

