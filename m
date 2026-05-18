Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6467382F03
	for <nova-gpu@lists.linux.dev>; Mon, 18 May 2026 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127905; cv=fail; b=TpKUjZrFMnWgX3xZVaDbexROuJsMMxKDtuQoJLeCi7EKDaakGk4/VG4q34d+eco/MAjRpp4yLYHfdyyHJZdWYLRsw02MK6u+rQA7VYFWZQ9Yy8n95hUPrrlgz5NGTkYVRl2a/ZJsgrmerSijtEsj5ykxSoCMHY1RkAcXMzRjcLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127905; c=relaxed/simple;
	bh=EkNpZZIr9xsQ59qwxzVp4LbPhrvQ2vFsz8ueWQyw8Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qQ1Rx570OufnSBft0oJQ8VNP0/JfGqB9fr2oM/eUKHm3uatm2fKGy6daRXoj/wwoEPEhEAJOZf4tEdDs9bGccfrfrk+5yI+8XjNgTA3+K+eP0nm6qTK6CmEHQMC/Un4VkI0pT887We0KCruwEmkInXpmm2zRO0joC8aEn65OnNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ceVWkdRN; arc=fail smtp.client-ip=52.101.193.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ceVWkdRN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C956wlYllXWTxH2ghW+pY1rFrdUH3f97Afy31zO3H6MKkDqRbJHUgA2om99P2iLOUHRP2fQMdG8jzbclTFI/H0JE7SZe846BBkjynRtW4+B3I1V7qMxmYyLe4IaueMaNdhZiRVgyv/Qky/2I3pPoJDrkyvThS1XOqkjsEQuWnpw1yWj5U/9JoHcwmGDEv7DvzvBGTU+TIKfZZ4I5HBDM3wHwAF0h6c5GIK731ZuUjWAY+GN7KsntjC+OwdmELLTRbuoT/pknMU+EMExYwnrB8bRdaBePdSSLfCIXp3t74V5e9iNmybh1tW0+Sofwo4IJd9Xur6Ua+CUWiqCnMXD3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWYDsvwuW3jMdDbsBQTdvSLy984Yhf7xN7KB7eD2xHA=;
 b=HHRnQfP1/9fppYy0wP6HKr7vNCOjDGkNZQ2LvgdBNWUx75vm2NiT77kgbi4nGaBP/56gK3p3MDbFK6ZOR+ERCHzX5LS9GpKhjPaRQYtZOGyzuoIZdG1uC1GgoKSxT4jYoshh+jhLoJpt/0QvniHEQ3UsTZ7LeJWb+w2/xUrFohWL1Yb6tS4ajqTj9NppNQ7DJuANcYLQEZjZGgk/jJGl8M/p/o2fxDqQNb1E5a1T41LG46A/FL7oDx76IOwMCwj3ZY/roUzuUwk5rxl1dIlofY+CvEvoOT9XSGjSKZc3oMfo7P9VDhM/XG6BemfBWpPZFN7ETLfCT8ofu+Ch/lkY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWYDsvwuW3jMdDbsBQTdvSLy984Yhf7xN7KB7eD2xHA=;
 b=ceVWkdRN7+P1j1HF3BdsSDS05rBssLc19lBtkmQrZK5coaW33nCn1bmXVu02hIZui1AQQd4xkyB52Naf69FY+EzFJQHj8o0jyeb5giD8+jz5ZR0DYYzgcnDTytwq+d2wP3QYGS/mk2xppDBaSwEdNzAGenEavWK2MlVqxmIQYENMxT3UmtU8PClwWVZpq2foEBrDMpuR9IpW2JEIhhJ6ktid5YQbuFE9MCnLj7TH7YQl633vbIfDFYkMYZ/sYTOkMBa2WKW8LO1c/v3ttc5jQkl3Bz3+r4oF4tcw8YlV4xp43sORTcI23ngmGWjATyVb5k8uMquVrd33RO5h+iVeXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5952.namprd12.prod.outlook.com (2603:10b6:510:1db::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.23; Mon, 18 May 2026 18:11:38 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%6]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 18:11:38 +0000
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
Subject: [PATCH v1 05/16] gpu: nova-core: mm: pagetable: Add PdeOps trait
Date: Mon, 18 May 2026 14:11:14 -0400
Message-Id: <20260518181126.2493572-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518181126.2493572-1-joelagnelf@nvidia.com>
References: <20260518181126.2493572-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0978.namprd03.prod.outlook.com
 (2603:10b6:408:109::23) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d10b99-4f2d-4a04-0dd3-08deb508e789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ldAAVuDJIJdkzTSre2Hn/F0FOpkqwhp4Z4MOxqxZmEZulRKg/vcQO1baBbf2MK5jI/BXmAwSKXLji1cstcLIeiIw6rmyBgQbPGtiVG7s3S3CUcj2H7adFDNi4UO1GdmQmJk74VfcbY5RwW7TrNL1+WjSZf4uMQbtn8h0AO8I7J5thQgQCN7f9ab2c9eK3e62Ow3U2Xn4KykrqjnIzhgXB4x96vtk+NpQbBAEWCmdL4saOI0PUH+j4ebskjAXO8oudIGnp+BcJrvjo2m6KTjPCmyeU4H/kE2v/c2mJ5rRAwMDUrCC/2gsEhMOFFWHln99A9qsMp7RKZLYI7SATYmpvMKB7lp8EGIECnUtu7uzHF/94jW0aal4Glv4JMT1030Q/LNNxt2PyWBBsMAO33Jw2X1MV5bbOUL9yfm2s5vF7l7IkQBWXvNWs1ojDFNcOkDE3WNYBbpRnTHJLYEWQrrvkjSYdMTfLS2oOaJLLRkWPwsRxxQraxInm/yQp65u9scuLmm/2PaU2tej9skRTfe6Tp7qeDcwbb3QZCXnhStQdbrWKl/9x6YAMc+B+WRM4B3aDCb/2620PbvixLOk5gAtLf1dcK0Vszpevt7ahNa6zTxNHDbZ1QCGAZ0a/j4r0t54OiUCAZ57eFnTmECii91j7zzinFx64BI9PgkFsFO80WoJ6Ab6y5/szXkU57ryHPUL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ov13SBfsjeS8Tya3MF8XRDTV64e37uTYcbz00ftOAvxUIPhcKwVSRCDFXJ8q?=
 =?us-ascii?Q?yhD7IfP+Q6KJNObIaUOZedaaDMznQwxUWDTU17CTSx3UwqUPe3kKzUe7j0xy?=
 =?us-ascii?Q?dFsAUSlEXLbvyy8HHpZxugnth+YANdbBweyMqfz/YWq/Xmc/sdScC/FBqpgd?=
 =?us-ascii?Q?iHjjjtDy/zo2p8h6ni0R0xJjkNUOdHzsiGIp7lPGKrXnIwY0k6YGJdeHWT0p?=
 =?us-ascii?Q?FIIgAndSAvn3EJgwLQ0f39wpZJHbprJWSs8fRUCYqJQt5z18DjKYtwxU6HiZ?=
 =?us-ascii?Q?alqzMVUD6YCHTNTkuu3lQE9j2ZKCYiuWMFcetQhlGH7fM5fgZU6hkZesIn/N?=
 =?us-ascii?Q?HbkqCWKq5lrEZ1pa+yh4TCdXqbRp2k/c4XE1YnOIAlgkcDOxcMASJ6sd7RR7?=
 =?us-ascii?Q?5AggsvpSRLIHWYgMRQ1YUiq7bDzHqglwKWWrm6JgkEy/b+Hy+B4umyfE1eJc?=
 =?us-ascii?Q?MZeniLaI3dJkvx782a6BzXEYiXZlz1x4xgqrfp8H8w7vRSheUKnHct6m2Svr?=
 =?us-ascii?Q?3cXxPRt54GUy1Vt+sPwQM4m+BkiztKXplTxJZeucUl10wpSVgySpkLgT0/66?=
 =?us-ascii?Q?VHwGWWQzxssqU7Zoep59JEhmkzJZ9YBvfWEgBrOkUfULVp7aMZEDseTANIVJ?=
 =?us-ascii?Q?VNzOLLZNuC5XC1xHL8VAeFzJmHd0SwR/gO10ZJLc2ifKi6v5A1OyFpUgfO6a?=
 =?us-ascii?Q?/kuUncUchfO2pj/EsYpPvDR9Q511boYIs8hSupieijiagTBcegpwxnGHIHCN?=
 =?us-ascii?Q?yF0lUN8fOiL2icHQlrV8MCYNcwSPAQcl4OAk7pZ2yRex3EEvOdzq4dBzWSy+?=
 =?us-ascii?Q?FMZTGBuNUonnjOKT178rxiIVcSqGUY36MsE9U5qpt+XT0ujwxyVuu6oBEE5V?=
 =?us-ascii?Q?uR5UTYeg+wNcZWOzcFz5nJ8scGOLfjU7m6lYaxVT+mo734m8TCYXw+bET7XP?=
 =?us-ascii?Q?hFSGstqfrAJuap2H2nTBENnb5orm7kT1MthmG3aqpGMUOEVKL6Yw3aCNF9/0?=
 =?us-ascii?Q?Qb+HyCBFSmirC27SfmD6CaNnFSqI+YFx8TIjkHvvHSLYgPuyGZ2ZWcOMXgsn?=
 =?us-ascii?Q?5rJeT9voKg8gZb0gYuMUI1XZbSwjN9QqTDIWdhJPjwuGAe3b1l3Jy3frM/an?=
 =?us-ascii?Q?tbCiQ1k7EWCpPeFWxrGqY86SiBar4U/QJrBZWpxs3XmPGa5Kh1dxKMSEY8/B?=
 =?us-ascii?Q?JjWUiw1El79HVX4cfGcdJuiEYBoMqSblCimp9rtAJJJrVWe5e9xTvEHVpLUt?=
 =?us-ascii?Q?mo6yZyn+10A1rhy3smEzggZi9igWFlNZSiIxph5OwFQSPEHFYwigMALQU9vW?=
 =?us-ascii?Q?KmJJGVnEgaqHAUZmbH4BzEGrMFA008+b6sPLCT2//VHko/8AOCQhfQnG68jx?=
 =?us-ascii?Q?DrnwBF30JvNO3DVaJJdcyn0CyrUKPxdZRvJFDLTUcpWbgyQ3hxe5BqcM2zx5?=
 =?us-ascii?Q?LeteiMP3D+Y8Xj+xhvrbaOb5tpj8rLn+22gjjmy8uULNZL4vPVJxFXnCBAGG?=
 =?us-ascii?Q?1tJxv3ygyIJ9KX9kbNV5y4DlXoA2kCdhdiT9U/LNxjku5NBWAHnAeX8vmtMi?=
 =?us-ascii?Q?sLQDybMt09rqIqX9umYSOpkFub1tW93Ak1sIHDVbJnule0r+KGTWnMkF8euc?=
 =?us-ascii?Q?u5l0uwpxeNOzWoQrwuVabxIndciRCWCxeWhjK5ZPp1zSX6kDH9IjXExpEb54?=
 =?us-ascii?Q?NTUJgIvv9lxoRyCEuFOI9rISOMWpgqbO4xKFmb7u5WrZi9km3Cc2UMUjoLay?=
 =?us-ascii?Q?ljf9V7qZ2A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d10b99-4f2d-4a04-0dd3-08deb508e789
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 18:11:38.3573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76+OnIbOD21c4bJU4l9ISfog40Piwcp027Y4ZWHO5MyLaMJc1WpnR4AxIoQm5lKejqhE5UygvtyHXUYj/1bMOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5952

Introduce a trait for GPU Page Directory Entries
(PDEs). Default `read()`/`write()` helpers via a `PraminWindow` are
provided.

The forthcoming MMU v2, v3 PDE structs will each implement `PdeOps`,
allowing the later page-table walker and mapper to call PDE operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable.rs | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
index a92add82eb10..1c94b3afa8b2 100644
--- a/drivers/gpu/nova-core/mm/pagetable.rs
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
@@ -122,6 +122,43 @@ fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Res
     }
 }
 
+/// Operations on Page Directory Entries (`PDE`s).
+pub(super) trait PdeOps: Copy + core::fmt::Debug + Into<u64> {
+    /// Create a `PDE` from a raw `u64` value.
+    fn from_raw(val: u64) -> Self;
+
+    /// Create a valid `PDE` pointing to a page table in the given aperture.
+    fn new(aperture: AperturePde, table_pfn: Pfn) -> Self;
+
+    /// Create an invalid `PDE`.
+    fn invalid() -> Self;
+
+    /// Check if this `PDE` is valid.
+    fn is_valid(&self) -> bool;
+
+    /// Get the memory aperture of this `PDE`.
+    fn aperture(&self) -> AperturePde;
+
+    /// Get the VRAM address of the page table.
+    fn table_vram_address(&self) -> VramAddress;
+
+    /// Read a `PDE` from VRAM.
+    fn read(window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result<Self> {
+        let val = window.try_read64(addr)?;
+        Ok(Self::from_raw(val))
+    }
+
+    /// Write this `PDE` to VRAM.
+    fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
+        window.try_write64(addr, (*self).into())
+    }
+
+    /// Check if this `PDE` is valid and points to video memory.
+    fn is_valid_vram(&self) -> bool {
+        self.is_valid() && self.aperture() == AperturePde::VideoMemory
+    }
+}
+
 /// Memory aperture for Page Table Entries (`PTE`s).
 ///
 /// Determines which memory region the `PTE` points to.
-- 
2.34.1

