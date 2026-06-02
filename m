Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011033.outbound.protection.outlook.com [40.93.194.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693836A363
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370513; cv=fail; b=k2T2ZQt1iIzmWB05C7QCR85jiWS216b09cxb/vKWPGFWL5bFakwkU/LOzvqSDcgNh+yreOhqgE27a2Qjv98DsG1uoU+Ul237AnV+/3HUzKvPj3jmimYTt5tHxDzup6wMSvsxEk+C4Jxm9UU5k2eQFm5IsaWBu9bIweOz9C3K2c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370513; c=relaxed/simple;
	bh=IIW42ql9fvmFkogSspER/dEnrRvLD5n7l0VCDpDAIw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GsyUVgalivP3dNGqgcnz3DxprIipXhqU2FghA8PR7NVH3N0oxJiNNHltInmlwSbk2QXtsjxzK5yPEfgyV2YtC/Piqtt7OEvM+6P+FupYcKyfH/KMfJIW2Chj9OxvhtioeTKEX0Ue89vMjFGa0mPrcU1pTnr3t+T3cu5x+nd6y4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=se8trLjX; arc=fail smtp.client-ip=40.93.194.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="se8trLjX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRJWu1IqdWUvwjKl+zzpjlkqTRl35sh75hI8z6Ov8PWGzMtl+thIeV6s58OAA/PesWe3fm6NZtKJerwCP/agTMt4rcv8dBS2jLSWGwVnVhZfsrovCsDi0/6KPAmtGloI+Ch5RBGJcP1XTeyM7ed1ThbLAq75ygE7HhD4vqI5kdq882tnwRB2kvlfsgr5aXdeXDwe4oeqDjGTHuhEU1uBW5Yeeed8U1OHTnajUP3Dse31cwVN+/0zpbFKjUsArhk8QBIDUipGu1y4BcgzqTMzy+eEiSHsNXoywX1zFuzLMPDV1yNCrQu5nXwQhFJw/cfFW7bfmGHPNHe+hxGMzrUMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFUdAFw8H5ot3XL9OFG2DCwcpBYiWk0Q4k0tZVhwKIo=;
 b=OhZzqFDTMZRTeCqg1NPxAsebOg/eFocRV6UMEExoV17REYr4cPkHI7JgQJW1j4hDLIfBVAJaPxBzLS/qJ4UJuNMPU1A1EXOIHQ6LWAn+2ce5lgoJUeM40iO+MTxaPsvniHPAy1LVQYf0WUq3kfrEcgpwj4K/noYnPB/ZsIXmeJL1x936tfkNojEP9h1qtzFKPeQ47whMoZIC+XTgpDU2RqqBiLkAv0K81ps41TFeeIaAWl3onS3K1lav7MDxeAtyQKUqEVyxO9OswCUhCawmovbqNVfP9j5TBe2Z1/z37yWrdj3aYUsH/uG5gqT0lNWGuBRJ52jNdHuWDxdpfIHO/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFUdAFw8H5ot3XL9OFG2DCwcpBYiWk0Q4k0tZVhwKIo=;
 b=se8trLjXcBAPFKFwYEV0qXpRPLZr5XnubEm55eAv0twIMJkG+cvWRbmkDrZMIvEh+1VHQbcQd/7sXWt99WiiJiB0z3ROrzB2qETs8zNJ7OUX6fkcODN3sbAFAYPjS2L/vUmi6inL0a1vrS0arFqpLV+pbeKN2eMVtnOnjSAA7jbp+mP4juzNomB38upX5tGLrM0mZW4jbkmRVIwE5gs6J8EM1+hw2I3NApDKb18ISmVz38HhgqgynX+3LqJqjhKoR/z/+n25/ZFVko1hLg6pl91HoUHzlmKR+L/tU9SlieoSlxrjkUEhsp6FYhtXWW4kIvtnE+WeyJSphnKAbDW+xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:40 +0000
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
Subject: [PATCH v12 20/22] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Mon,  1 Jun 2026 20:21:08 -0700
Message-ID: <20260602032111.224790-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f78eb74-7a17-4910-b969-08dec0560fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|56012099006|3023799007|18002099003|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2J7WneB+RB0ajsUO1ommGVGVvV+hyRm0v7qK3f9CmLLqrCAAZpgt0CYGiTeY51WsKWXXV+DwGuIB1H0WdXpWnhzELhZWTLfGKQjyd5W+v4KebU8t6eiJWJi3UIz645im3nHo/nHLbMoJCMlh1tsAVyKRTBeR8NSeFULbcjR0zZAPM78d1w3yl8QE24RALlbHz4EbpyKAN8gDZhgiD7mUcdkYmPYe9v5B5CdUgJvjUq+HG37UTh51cY6hoBT7bFT0vR/aEVYeH4jYATnm9HRu6JsCD4umlUgk3z+6A61ordjSD+aZz8QqQL3zngRuu/XS6GGKUByjIskY92IHk0L+rr7vhk8FmE3pQw6hrT17iEnvbKXKC8FHXN/m03CLWXREu2n7hf7oenSTR489WyVMqxoFHjgaXI5TwAy74cA1943j7ZE8s3QrqHAcxQmjdsHAzx6G3LpqxMoxeDrVScGXpKo0YwT2+6W6JHLjjKr2J0PqfTpslRqyEgotx5os1k3tCi+arzjMXXfbj7o2w79ZYhrICakgyVvbn5F5kCNE26qBNlQVR5gPtJbm4Vc31/WG/UJPYtJ3bFHzL3atPaJmCdAZOMitWgGy0wTP80p+XAmOmUIPh/iUmj9j6fnb7foz94+dHV2XRFl5wO0YVRwD7egcpRiLEC5s+3P5d1eyKE2tPzUBlb2wPZJUPmhRs+qN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(56012099006)(3023799007)(18002099003)(11063799006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OBcRT2MnicGQ9GtcyRM9YiY5cRnHJLuBRs3eGfsYMgcXRyRrGfHUpr0eVb8e?=
 =?us-ascii?Q?KPAcu6mWMuXGOs26cDyJyb9Ky9hS9ebaWkOmxsFYDAMRB/EAPUpJ/geHOjGl?=
 =?us-ascii?Q?vjfLSl9aTv0DqfUXoLEk3gnYviDr1y3Z7TenLKE533jX+Jn1ABBiL1Rzjsl1?=
 =?us-ascii?Q?n9shpn4ZsPpO5Huv3XK/MrzwCJSDX79Iz2B20Vh/GlGXmXENoPdv/wGuNX+p?=
 =?us-ascii?Q?IyeF/cqMStJwWxFlSC7X0KQLbkgTv+wu3N4Cl2bWih1MzMV6FfGJi6Jo2aNe?=
 =?us-ascii?Q?SskR+YWw/PKtttvQdhXTkyFpLtd+AftSQUrHRZS5oPUIA0F/itcVe2y5h+eM?=
 =?us-ascii?Q?AhM5fq+TDrCQbfvfFdjlQn0jkMp59vz0tQKLN0kUUPwJQg3NG0f9Rz+6SMSl?=
 =?us-ascii?Q?8RnktGAcTB2SxKI+rxWzqkUs0nolwfypdxk23sQEFFGJBo8q0hVLPpjXFa92?=
 =?us-ascii?Q?ATVHhRxeJYtzk861eMULfGQrLEWMtX3T6LJv3hTVo+oBH/mpuuV1zt3Yvv50?=
 =?us-ascii?Q?71Kf76c9mgtNQhYwc+CHTRhQEz26KrInhyifjZeSQWWzrJe5u9YFLCPQGczy?=
 =?us-ascii?Q?WdKV6xxQYZgeJCUWJ5XRbNzR4aRG0l/F1yNn3MXbigu4iwXTTYHWD4NAX6O2?=
 =?us-ascii?Q?ZrTXVNNsw/XLQj6NQwpw3Gg7m6VfuvdgPu5WEOVsU2wrPsnScjekn80vWajc?=
 =?us-ascii?Q?HgJOFuxU0p3b52dfRObI6X0qz0HHJLx6T6XeZVqy5YQTtlamESY32EJ98KUS?=
 =?us-ascii?Q?g1UDEVNmhP+Y6Ypdz8vPsr/JwXkJg5J1Jichxka2xf29YpLDFcm6zW6Ika56?=
 =?us-ascii?Q?5JTH6thy1PrjGEfScy0YFUvjV3OylOAwmTBjJ2PxogUOQRAGybjrrcu22eVN?=
 =?us-ascii?Q?6ibjbIPORNHPpDAG420VbiHBo9QgMBdOlv25iikd6a5Wj0avA8/zErk6qLRc?=
 =?us-ascii?Q?ktZUB4LHTEsFQYlJtiFYd4bSaD/aK28eb/C0zkz5uvFM/a6UESUL9WheDuQw?=
 =?us-ascii?Q?rXr7tIR8Q2Pr9NsgKtk6L8g+6ulXrsBFWvRMIo3L6Vmj+5LFKXqiR0TfSR+b?=
 =?us-ascii?Q?jMvBZuTJIYtAbicvyd+7mokrWW/NR7oF4hqHVvFhBsqsweJndoNxBGdAB9pK?=
 =?us-ascii?Q?J5dm3KhAAsd5M5O1Vacuqe2kgBeBsnXGjYU7bm1XJQFO+uTSwmIR1AzdX63L?=
 =?us-ascii?Q?U/Fk5e1t0U0ChErq/NU4ygZDetpvEXG36Kvym8hT0gBV7jigDAf0CCvZoZ6a?=
 =?us-ascii?Q?VyKN4kEz2fnBh45aYTAG0LRiQ1TJ0mtwD9QIpz5Les3RzbJjs+2ntH+yOrDw?=
 =?us-ascii?Q?wCsQYM4+xb/6s9F/L116wb0uUWkHfOaFRbrXoNOrNJ6lDjF8fBefhBzcK65C?=
 =?us-ascii?Q?yyYOeLXfP5N53rzox9d3bjXxQl4VfOlNesQRJeNXVx/9raIc74S2C09PhL5w?=
 =?us-ascii?Q?CwGTNkVtjeR6DwpeDxoPDd3rM6y4+pB2mNYnx4qjji3IWCkTXo/INAsnmMw3?=
 =?us-ascii?Q?pJN+HTqEH09OZbUXgh6mcicEXxwp09/Oj2B2gDoFLBWHhmyIWFAY5dy4CGfQ?=
 =?us-ascii?Q?+LfnxRxn1uEiGiCLXBftl2AO9jJOKb6FYmI9tMtugL7Dfm1hfY2w7LiCyKEA?=
 =?us-ascii?Q?PfUzVG8e6M5gzhc14lVIJgU63UCG6BMgZyzDg8ArHYbAi5ZqrxH1j8ZfsBZO?=
 =?us-ascii?Q?j5cJRJncpE79CkaDIn21SqjZYCZqm7OtfLybSRuFzVtZkuLs9FJwNqIk5F01?=
 =?us-ascii?Q?Otn+hTD61g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f78eb74-7a17-4910-b969-08dec0560fc7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:39.8962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toOGjpauEq5I1FKCmt8l8iEbmrhqVwjLEk0N38HCIyDQ36BO9amy+LK1LpZizrx5A3JfvYY9nlQH+IqaR5m/wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs           |  1 -
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 90 +++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs          |  2 +
 3 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 352ef7683cf2..aec991afa669 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -142,7 +142,6 @@ pub(crate) fn new(
 
     /// DMA address of the FMC boot parameters, needed after boot for lockdown
     /// release polling.
-    #[expect(dead_code)]
     pub(crate) fn boot_params_dma_handle(&self) -> u64 {
         self.fmc_boot_params.dma_handle()
     }
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index f41f3fea15ff..02aec5281389 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -5,7 +5,13 @@
 
 use kernel::{
     device,
-    dma::Coherent, //
+    dma::Coherent,
+    io::{
+        poll::read_poll_timeout,
+        register::WithBase,
+        Io, //
+    },
+    time::Delta,
 };
 
 use crate::{
@@ -31,8 +37,85 @@
         Gsp,
         GspFwWprMeta, //
     },
+    regs,
 };
 
+/// GSP lockdown pattern written by firmware to mbox0 while RISC-V branch privilege
+/// lockdown is active. The low byte varies, the upper 24 bits are fixed.
+const GSP_LOCKDOWN_PATTERN: u32 = 0xbadf_4100;
+const GSP_LOCKDOWN_MASK: u32 = 0xffff_ff00;
+
+/// GSP falcon mailbox state, used to track lockdown release status.
+struct GspMbox {
+    mbox0: u32,
+    mbox1: u32,
+}
+
+impl GspMbox {
+    /// Reads both mailboxes from the GSP falcon.
+    fn read(gsp_falcon: &Falcon<GspEngine>, bar: &Bar0) -> Self {
+        Self {
+            mbox0: gsp_falcon.read_mailbox0(bar),
+            mbox1: gsp_falcon.read_mailbox1(bar),
+        }
+    }
+
+    /// Returns `true` if the lockdown pattern is present in `mbox0`.
+    fn is_locked_down(&self) -> bool {
+        (self.mbox0 & GSP_LOCKDOWN_MASK) == GSP_LOCKDOWN_PATTERN
+    }
+
+    /// Combines mailbox0 and mailbox1 into a 64-bit address.
+    fn combined_addr(&self) -> u64 {
+        (u64::from(self.mbox1) << 32) | u64::from(self.mbox0)
+    }
+
+    /// Returns `true` if GSP lockdown has been released.
+    ///
+    /// Checks the lockdown pattern, validates the boot params address,
+    /// and verifies the `HWCFG2` lockdown bit is clear.
+    fn lockdown_released(&self, bar: &Bar0, fmc_boot_params_addr: u64) -> bool {
+        if self.is_locked_down() {
+            return false;
+        }
+
+        if self.mbox0 != 0 && self.combined_addr() != fmc_boot_params_addr {
+            return true;
+        }
+
+        let hwcfg2 = bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<GspEngine>());
+        !hwcfg2.riscv_br_priv_lockdown()
+    }
+}
+
+/// Waits for GSP lockdown to be released after FSP Chain of Trust.
+fn wait_for_gsp_lockdown_release(
+    dev: &device::Device<device::Bound>,
+    bar: &Bar0,
+    gsp_falcon: &Falcon<GspEngine>,
+    fmc_boot_params_addr: u64,
+) -> Result {
+    dev_dbg!(dev, "Waiting for GSP lockdown release\n");
+
+    let mbox = read_poll_timeout(
+        || Ok(GspMbox::read(gsp_falcon, bar)),
+        |mbox| mbox.lockdown_released(bar, fmc_boot_params_addr),
+        Delta::from_millis(10),
+        Delta::from_secs(30),
+    )
+    .inspect_err(|_| {
+        dev_err!(dev, "GSP lockdown release timeout\n");
+    })?;
+
+    if mbox.mbox0 != 0 {
+        dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox.mbox0);
+        return Err(EIO);
+    }
+
+    dev_dbg!(dev, "GSP lockdown released\n");
+    Ok(())
+}
+
 struct Gh100;
 
 impl GspHal for Gh100 {
@@ -48,7 +131,7 @@ fn boot<'a>(
         chipset: Chipset,
         fb_layout: &FbLayout,
         wpr_meta: &Coherent<GspFwWprMeta>,
-        _gsp_falcon: &'a Falcon<GspEngine>,
+        gsp_falcon: &'a Falcon<GspEngine>,
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
         let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
@@ -64,6 +147,9 @@ fn boot<'a>(
 
         fsp.boot_fmc(dev, bar, fb_layout, &args)?;
 
+        let fmc_boot_params_addr = args.boot_params_dma_handle();
+        wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
         Err(ENOTSUPP)
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 8c51609d0281..a4a986f89340 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -363,6 +363,8 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     pub(crate) NV_PFALCON_FALCON_HWCFG2(u32) @ PFalconBase + 0x000000f4 {
         /// Signal indicating that reset is completed (GA102+).
         31:31   reset_ready => bool;
+        /// RISC-V branch privilege lockdown bit.
+        13:13   riscv_br_priv_lockdown => bool;
         /// Set to 0 after memory scrubbing is completed.
         12:12   mem_scrubbing => bool;
         10:10   riscv => bool;
-- 
2.54.0

