Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E73438F626
	for <nova-gpu@lists.linux.dev>; Mon, 18 May 2026 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127439; cv=fail; b=P2XIHpHu22B7X5D0IlSEhKWdx/PVK4WCMgmC9qUosI4JR1UAa5ioVYXOgVExcVeo/6u6mTdMQHe23XYE6AkIGR3+qwWa8elJPIQluuT7TaJZsgnyMaZlglkK9cSQbQbXXBDOhAfC0zR8B3tv6GhpvUY3IcKH1990iiEdbIKdMQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127439; c=relaxed/simple;
	bh=U5R6WRkAATb8t4q7DtQtyBHLVD2jo4OEbSIe7mZyCGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ttsU5vXVaTrAz1bMD0TXfnAiY/GIJBYTBN/3PLD6V5RCq+ICH9yTxHmAv1+LGHOODDl/o5O9H8dpxuXqRJrrDlsYE08DjISJss0OHsV839+UtJC9dG5q4k8HLvDQOJq3pGFzXuz7zt85EXw1JhySxBAbMm9/Q7fKRn0lXGVKcrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JyabaLbF; arc=fail smtp.client-ip=52.101.57.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JyabaLbF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ciu1uRp++Bs5gYnMQ6IxWA1t3L+IjqSuAc2x2RANR7k41ZKT/8QJL6VOoIaLQvaz+17KuQvDp2V75vdPRIZIFyCmp4WKvEww3/27frYiXnyZXBC/Bq7+m+j4rQlXZT1vyqIANKRwN3HeZfp4HzAnKLF+PJnkKAbkVB+E/aaPNHjcXIymiRMD+tbC4zRtQc1+lm4TBywmMJ1k+Mr6CA01oAy06oVWrdx2hCTz5DinL5wVg03OjiYjrMHQb7juomOY0kcoK/xpqGiUDoTU1120ciiCtERgW2AZJto7E8KIr7jhr2bE5zoqQs+xFuLwdqQR1UahS8q3O9N5qeH3sYa2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tBwW3Pn1lqz7R/vXRoW+sMwdl9CGmW2rdM8ST1Ui4g=;
 b=mDTeJmMyWpf4xXvr7lweuwqmwpndBA53a68f9FlXKeu5nHBmdYW2xBppqyeoPCbBnDQv+3R3AEV+IYpZxU0625YhMpVf+PU5Nk2808E9KO+GBCxkP8m7prjArB00DDYVWGwXb9OdgyKNDU56oODhc9YnRjit851QTJr3Qi5fdzAg35uZBk8T/BDpVC1qH1QRiFsBschCl1lc/lQl8NfGFHOKTx4+bAY5yPpRJjcmi/XMSSUJOwpKn3f0fpHWzA8Wn7zhxuGUVMsdivxeFfUGgIE5a/UP+O8UQLleAycjwVgUCpmbN7p6FlDRxNVCeX2HXLVmXqV9giTHW0YF/J6DVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tBwW3Pn1lqz7R/vXRoW+sMwdl9CGmW2rdM8ST1Ui4g=;
 b=JyabaLbFzbuCvnH8dyMk0Ry/IIl+y71oWuq7vRSD7YLhGNmIOdp20pgvvGV9c20gGdxte54rl94u1EPG6fuHhwkO6bZKrD0aJAF9ZywOj6FBpiJsONM37ErCTl3j4hW8LxKfqeOuWnY5gaNm6xN5WmDoIB/RAxil5CU2YXWWYlfq4IIQXbNtsA0DNOgmkqsfaupam6NqCLQp97KAv+kx2s1CsGOXsRwdDPqmjSHWleA8CvETyYeh+ln8H/VPtzQOGKBSNNoHT1LJ1dJihPKPcppMR0k8lTGD/gfvlgb5mtxk+ItmO1b93wItF+hHLOHfMI7HFKEhrKoW6C6NJUmDCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DSSPR12MB999212.namprd12.prod.outlook.com (2603:10b6:8:376::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 18:03:52 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%6]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 18:03:51 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Airlie <airlied@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	Nikola Djukic <ndjukic@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Andrea Righi <arighi@nvidia.com>,
	Andy Ritger <aritger@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Philipp Stanner <phasta@kernel.org>,
	alexeyi@nvidia.com,
	Eliot Courtney <ecourtney@nvidia.com>,
	joel@joelfernandes.org,
	linux-doc@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v1 04/12] gpu: nova-core: gsp: Extract usable FB region from GSP
Date: Mon, 18 May 2026 14:03:34 -0400
Message-Id: <20260518180342.2387845-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518180342.2387845-1-joelagnelf@nvidia.com>
References: <20260518180342.2387845-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::11) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DSSPR12MB999212:EE_
X-MS-Office365-Filtering-Correlation-Id: e1806288-3860-46f9-0e49-08deb507d14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|3023799003|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	rjQtbmbIipNtZoSoFEaIGgZyYb7yHhAWQCL8gR8H2jQIiCbTHh+3HUtsMyz6kURgt082H+kzZR3jLEVFgpNx7v7Kcb7naPkK4RjvR0HB5Xo5PsR7eVdXoUVbQh556usmMRvpUiSOKlFeKmY0AY3XMQnTd+aLAh8mqHEwYUW+OKv5kyISjomfTTAb7LCe2cGIMiFaGgcF3eYydrhDGw10CBQDfgZV60tOc8Im9Vs3KDSCJak1MHXdEpYHw+ui/r5EqVTi/BkfsSQcms84+nN4RX2xP1iC3ijfeEerTpyA9FRrvq6JBj+C1Hl6qUCLPfLdB8JvKL3ii+Tj7Wzaw4ypd6sgjo/VxT+TTseSvQU5+g422HGMP+ZycbnPhPi0Ltx3jIZQeaJuWkVBPkO4QBIc4cucu0ti8vyKmroYsFb2sPtFfjZgfgOuvpJDYPCchgX2qzN/4pHx++ESdRQwNiZLacYYWXhFzWn9zjgz06pnCElZodq6etgNwOmQqjk3vgGE2k351eXnafegQTTkxhpMLVETiHi/s5tfSp7lB/3orMm2Kc/9vMNzClwjduQJr5nbTximRlAFxDkbx8msEAScgc2JVg5o4xbRV+mDzl/rp49pLvWPp6foNmY02lFcDdqmxFSdJdL7w+1vmEZFQ8HZeiQmA6Ur2SA0OWEbgwnIKprM+L9zjOM23Z4y1JPrMgFm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(3023799003)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y2Qc2AjNFg6MnMi5xRb4Mwekv58zb3+DqtrgmHM8uVJbRYEI/jCoxLBiwUxG?=
 =?us-ascii?Q?JmKiEEpfFElz5R+UgwvsASqa5veeRGj1+m5lgF5ECYGCToHVU+1090aGaM5k?=
 =?us-ascii?Q?Dd//5izbLDJM1G/xfPuu0dTz7lDMXng+cPZK5FaF+gzSb6U2ooK2E4aCoj5Y?=
 =?us-ascii?Q?62ulCF9DvcLN+ynQlm9HJfdQUN44NgnaKqhEiiMadc/jT0sW1lDfie5y23UV?=
 =?us-ascii?Q?ArIO7s5IflAKjX7+eza50LsmxHxOi9QpI5HfeFsa1vgTQoqkM7dl6u/9ZIGM?=
 =?us-ascii?Q?LJIOC4s2eqttxFYiDXGK7Yt1cGHCMO+y47d2dKSF7Jqj4/dOw/QX/aphTP/x?=
 =?us-ascii?Q?B6vsRHVRgleCvRVdiqVKNPIv7EWUDXcHz+xjQtzbgYq0F9S8YgfjEkd+L6pC?=
 =?us-ascii?Q?rs3dFlf+wLn8MoBnnWxwmd1ovIGjorMjmhpQPqfo4QxJB85/GYQwvipd+wCT?=
 =?us-ascii?Q?RlStuzf4q3wu00hYnotuxLlw/rT5bnr1XbIiuRSprZ474sK6pvbET3xu3XKE?=
 =?us-ascii?Q?bzyAxfrUP1k75bN3rkjjSNzz/jooCpDmOktP0vZF9JsE25fwIaB3qSZB8JTg?=
 =?us-ascii?Q?/ZOG2ac7rVqAgKjPiu2piO9+BSMio3ipKJwxKFPsB07CGb7wzPCYQef01znx?=
 =?us-ascii?Q?IfeXAa3C6bu/Px73R9Mq7y+R3Lv9c1vnQZ4tcLalpnHIIKYp+xLxctT1D84D?=
 =?us-ascii?Q?85OCQRBB91SigAj6vgjEYhPw+PZUy3/TI/v1BujlHkYy0uLRNa+eMUQgjLN/?=
 =?us-ascii?Q?A2aV4Bei3OeS+n3kQ9ld2LWxOmvtgGBnlahVgb9gUoEpLWrDwatzifOPgzLr?=
 =?us-ascii?Q?8IrH8nDyzXwIkomVATrcJst91h7AVlIDHljbLkQTTg+Ww9UDl1jz+r8bFRwY?=
 =?us-ascii?Q?F9qYMeBF/DaJmVLAIR+/pPybdqFVj72ubwIuFoMK3bqPb16UgruoDkhOHudk?=
 =?us-ascii?Q?9wD7uzFSZeVhOLOZu8WNkECuYgWM/Q2bPWEilq4LTZHNnVmwayiVXWpjiUlS?=
 =?us-ascii?Q?ivt3NsBmNJwxeExF3J7zf0vhEx6Cu0WUiwo42jBD8xWmAMB8nCFgPYcnEUgc?=
 =?us-ascii?Q?qZ2xwngGKJAcx2tC1Ww4tdOSkTP+tg9u6n3kfd3AWCfSlNYrpJNBLR7eF2B2?=
 =?us-ascii?Q?3sbUExAc67isAbzvImqa1xgelWKlaD4ygHYu9Ta6wrnXENJKuzi7ytOkmeEw?=
 =?us-ascii?Q?A/qDmD8Gw2aITRBea9t1N+s0GNJ5Ht1C4VZrhypMiiGtckaLAcrufefQXMjp?=
 =?us-ascii?Q?jrwQsd5MdQkTkoj+JaIXb+X5hxg3f6VPEy0ZKMi0XM49/Bm73aEvlpah8AOL?=
 =?us-ascii?Q?T1psu4So4sYYEEEfGPk+m/PyBNHpLxfG4q/7fQCgmfAiqYG5k8luRI0cWYfa?=
 =?us-ascii?Q?6RgkzwpUOERnGG9GF5vBZM13wejsYhTTFmMAnXNgQq9NRmN29CKkKYqgRAVi?=
 =?us-ascii?Q?u2QogC7K9qEU22y9BvVRNGun5tl0bNCoBshX4KnWKFIzuKgQ5+vmxCsRObfm?=
 =?us-ascii?Q?bLp9k+Ysvn+qxsl+Dbxuy4HwA8zAA3VuoFdON6Ft4ABlk6Jwjey7B8ZLAeHV?=
 =?us-ascii?Q?/ZraqvyrCsAPgYFUjsMdGW4xr8twYOJLcc6xcF92fMq6GlIquGNl67Zpoei+?=
 =?us-ascii?Q?IXwcZgzBaX4/Upp0HEAKEXxirlygzqG8hL2WGrA5XEeIlHzyPRmTjeLBmxye?=
 =?us-ascii?Q?05CUoZwQN+FoFAlLRfPIIfWtlD2RE4TMfmatVoJDNRVuGc72n0jTp38tPHFn?=
 =?us-ascii?Q?h86kt2svmw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1806288-3860-46f9-0e49-08deb507d14c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 18:03:51.5433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mvQ2/KyKabblp8c630XyC5sFCJK9venwXD8WRGNZmP83U2Y4cWl0PyYhXY13CmQk0J/PcgsDLnCFw1LxX9Paw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999212

Add first_usable_fb_region() to GspStaticConfigInfo to extract the first
usable FB region from GSP's fbRegionInfoParams. Usable regions are those
that are not reserved or protected.

The extracted region is stored in GetGspStaticInfoReply and exposed as
usable_fb_region field for use by the memory subsystem.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 11 +++++--
 drivers/gpu/nova-core/gsp/fw/commands.rs | 42 +++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index c89c7b57a751..049fff337611 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -4,6 +4,7 @@
     array,
     convert::Infallible,
     ffi::FromBytesUntilNulError,
+    ops::Range,
     str::Utf8Error, //
 };
 
@@ -189,15 +190,18 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
     }
 }
 
-/// The reply from the GSP to the [`GetGspInfo`] command.
+/// The reply from the GSP to the [`GetGspStaticInfo`] command.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
+    /// Usable FB (VRAM) region for driver memory allocation.
+    #[expect(dead_code)]
+    pub(crate) usable_fb_region: Range<u64>,
 }
 
 impl MessageFromGsp for GetGspStaticInfoReply {
     const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
     type Message = GspStaticConfigInfo;
-    type InitError = Infallible;
+    type InitError = Error;
 
     fn read(
         msg: &Self::Message,
@@ -205,6 +209,7 @@ fn read(
     ) -> Result<Self, Self::InitError> {
         Ok(GetGspStaticInfoReply {
             gpu_name: msg.gpu_name_str(),
+            usable_fb_region: msg.usable_fb_regions_iter().next().ok_or(ENODEV)?,
         })
     }
 }
@@ -233,7 +238,7 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
     }
 }
 
-/// Send the [`GetGspInfo`] command and awaits for its reply.
+/// Send the [`GetGspStaticInfo`] command and awaits for its reply.
 pub(crate) fn get_gsp_info(cmdq: &Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
     cmdq.send_command(bar, GetGspStaticInfo)
 }
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index db46276430be..50b9c205566f 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::ops::Range;
+
 use kernel::{
     device,
     pci,
@@ -10,7 +12,10 @@
     }, //
 };
 
-use crate::gsp::GSP_PAGE_SIZE;
+use crate::{
+    gsp::GSP_PAGE_SIZE,
+    num::IntoSafeCast, //
+};
 
 use super::bindings;
 
@@ -121,6 +126,41 @@ impl GspStaticConfigInfo {
     pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
         self.0.gpuNameString
     }
+
+    /// Returns an iterator over valid FB regions from GSP firmware data.
+    fn fb_regions(
+        &self,
+    ) -> impl Iterator<Item = &bindings::NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO> {
+        let fb_info = &self.0.fbRegionInfoParams;
+        fb_info
+            .fbRegion
+            .iter()
+            .take(fb_info.numFBRegions.into_safe_cast())
+            .filter(|reg| reg.limit >= reg.base)
+    }
+
+    /// Iterates over usable FB regions from GSP firmware data.
+    ///
+    /// Each yielded region is a [`Range<u64>`] suitable for driver memory allocation.
+    /// Usable regions are those that satisfy all the following properties:
+    /// - Are not reserved for firmware internal use.
+    /// - Are not protected (hardware-enforced access restrictions).
+    /// - Support compression (can use GPU memory compression for bandwidth).
+    /// - Support ISO (isochronous memory for display requiring guaranteed bandwidth).
+    pub(crate) fn usable_fb_regions_iter(&self) -> impl Iterator<Item = Range<u64>> + '_ {
+        self.fb_regions().filter_map(|reg| {
+            // Filter: not reserved, not protected, supports compression and ISO.
+            if reg.reserved == 0
+                && reg.bProtected == 0
+                && reg.supportCompressed != 0
+                && reg.supportISO != 0
+            {
+                reg.limit.checked_add(1).map(|end| reg.base..end)
+            } else {
+                None
+            }
+        })
+    }
 }
 
 // SAFETY: Padding is explicit and will not contain uninitialized data.
-- 
2.34.1

