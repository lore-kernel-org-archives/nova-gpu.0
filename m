Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4830DEA6
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113815; cv=fail; b=FE1GBq0Nb8AGLjiXF3NNvQfSc2FQnUdIHeD3XvLMpVjYHR+ULDDKm5IxFH7/MicQ4ZQQkdLHf3oe4cC00+UKJ4PjuFR587DdgQ5ENtSvfMTlsQvgRlJo3cEgnfl6/Y0Oi3uNZGE6T036kFa9mCkB7C6M1PF2k35XDobIDo/3IRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113815; c=relaxed/simple;
	bh=/9dz2M6ZqDholBAPfSfiQqG4tD70KWqisRPhPJs5khk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZ8R5RxPIST57Itn7H3XdQ3IHg1s5/flJUtf8uGU8y++X9vcDM/He3XSNxJCeCB7qCXaErn0YZV+GpApcP960LuW7ffOxBv1nfpD8sPQC3hq/xjlkDH8nSv2/W04Kz2aXrPQGbMFz8TjO35x4hz8Pp1+M6tSqBoYvPejFNoXurs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V7zcIf/N; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V7zcIf/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqttfWvH2iz/M8Atpmva4zTY2R6IM3Onwt+TwI/T3d6m7d+3360hcKYE3/eSH0p5TGD/dIFOxCChZOpIdax+Da5nweZ5OdRf8jS1vamrXYvO78al2UA8sHVCPCSpzD1IEPF6NexylDzTUEda4uqGjp+z2U4x1V9g0xHM6gDqWMr0lIO83j0p/7X0B2gZ3X0kC2BPW1oChRN+TM+8aUEY9/ZBCWCZfvwAvyqZ/FONbr9Lm7LlGlk7S6HzcDPyVCuHRuWJVcveXBYzs3zfWD+1ME5+dS0jhRUOlftImG9IGGbaZYJ4/u6LsDnQKw99W49GnbLWgs4tASJjdYYPSTP8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJxjkgHZbLvS+cnP/u2X3xXkg0Fy5ozdCmCtjTDYVvg=;
 b=JeuZV812hFQyPRy+NXLfmyye6W6FQjgck329LsdHPUogrQeK4wcsC/7vo8RzRXQQB3b6As5j/JTLEubaKYjexfvAVz6DuPJq3FidQNDx2YtC9w8d44aam1sXyrrwGChK1J/FuVx0jS8MlvKWFwX0CTDCwvv2wuA9b2dDs+HBvlRnyo1P04iJ5QPt8r7fZgjeh3zMCZUHAiYzyTCFjBnwWb604pBftNrg5kfGx21Mb+uYF/7MIPxolOJRPIcRlRiuPGquMLiscpXpFDM6Kr40AvdpwoakUp/7shIeC1goxAlBdnJwdBmoP24Z9Cx7nsuVk3O+/YEoc5eCF5PLR6UZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJxjkgHZbLvS+cnP/u2X3xXkg0Fy5ozdCmCtjTDYVvg=;
 b=V7zcIf/NLaHql2a+LXM03FCp8XAZ3aoN9EjMO86ixENc78rkhNj7Yks5/L8qYh/pzd1s19A5A6AWCNolVpyKyejU9y2+k2pKcsohPPEn4DTDl+Go4yo+ENAAf6xgW3rtqyn7508I7xLJOdH4rWN0NiYT5qHQwhICIYaYPSYsVG7XuYuxbnhRJkaEjoh8nrHhApeyvxus6C5oUp1exAAdYGuJtghybImw040OnSp+dIrXo4y4ELa0mnj+HlQk4uRITcdzo20opVzyr9J8j9CCrYWb0ebdc367D9b5RXOstORZsHvTJT1L/nkBcC9qLnZPUi2jtNVT3ljbOKWyB1a0xw==
Received: from MN0P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::15)
 by SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 17:50:06 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::5d) by MN0P223CA0013.outlook.office365.com
 (2603:10b6:208:52b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 17:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 17:50:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:43 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:41 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	"Alexandre Courbot" <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>, Eliot
 Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>
Subject: [PATCH 3/8] gpu: nova-core: add TLV parser for firmware files
Date: Wed, 10 Jun 2026 12:49:24 -0500
Message-ID: <20260610174929.744477-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610174929.744477-1-ttabi@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e21d32b-815e-4afe-bc28-08dec718b53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|3023799007|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5jhEJiEWZzOl8Lkz5lL/tdUBX4XwtNvkSmrYrws7UkvMjQl8sicWqW5GNMHBaAyf6HPfJmVHHQ9tiBCtMc+0aY+ykrAkIZHc7/KfDP507o2W+X5diljQN01F4wwZYknBiF2yC+8KzBZp7SdbYWdMyqKqOk9SRVEKMRy46CFl9RvT9aH6MUYugGI5aQh76UoJXaT6e2M968ale0nSG/IkJMR1isebBjTqiV5UI0v57RTXktErRNgBXT14wTgQZ2zqD14gWVt9DEXSDbZDajMD8UCR2FHJANrunWk0wMWUC9bv5S2cRD6pfatBVxwF0lfWQxNVVAZkbbWzLE/WuyAD9HhlS4ieFQILcfHfgC66r/u1KR6blwCImu1maYHFkltwXR/KxMkFKq2bQjaOgQHm383oFLpVuUra0zRtYVrX4JhEo37CHJ71jcQmwZ4oz9TEJRBKOeavAUwdB9q3iNfQfevC704m+FzrAoUYbxJu4oVxWZWJ1v3awuNVEcyh55gGPlMd9tOecnDEsLQGyvunYEdRClr6tx8bCJOqqLmG8pjdyB+5IWXJpc77BZWk7U6q/RwLq4YTpNwtU5s+fO9rUki4en2W0lB1rUI+1rC7U/MXbRUVjiRkWVO5dksOyfXhIQAAQ6i4h5olr26xVnHO+mVjvsFi90YVgqOTg8hVVH2FCShhXYWfG+iuItSRgHyuKgQajQo6ZFb61elBdOT/Ir1fYdqpJdx62hI9UnhTThw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(3023799007)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9spsPfCYrYq3zHPMaAXErNwcqEfgfAGejCHYx4TSIwJmFK4oNOnQLvLQCjfrcxbyvrRoP8ZKogJ6pcb+ApfsQTI2IJSUsasr10oBdQX2cTx7ZM3Bzv+fdLOOXr7tCfAwxKCkjcjhJoyiY1Jc0VUUoXiCbyjEOCaDywrVv3W1stn7g0lzmojHCF5hHs4UgNV5/fHL5ess//oWirWTCALGH/XHrjI1vy4A8dGoowRW+2k6VSsvlC5JnzqzeNExALWhADcecDjDVGP1PWP2tvFwxVnPJ8Bl0/Ru80LTlLpFHYzEvuM1I85a7RdD+yq2uhm0W3wDTR4uhyKviVciP/ZU56QGB6fVVebN5wydvGj3zzOVEDIkVx94+F7yLXGIjYa065RVCWXl7a9TIrFSNAV8WE06fSsWtqCUos2raocMp+g0s43TrkQjhjRKMYHIfG1M
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 17:50:06.5338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e21d32b-815e-4afe-bc28-08dec718b53f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457

Add the Tlv struct and supporting types for parsing TLV (type, length,
value) firmware images. TLV files begin with a 4-byte magic header,
which must be "NVFW" for Nvidia firmware files.  This is followed by a
sequence of blocks each containing a 4-byte ASCII tag, a 4-byte
little-endian length, and a payload padded to a 4-byte boundary.

Tlv::new() validates the entire image up front, so that the iterator can
subsequently yield blocks without fallible parsing.

Also add accessor methods for the various encoded types that will be used
by the driver.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 Documentation/gpu/nova/core/tlv.rst | 172 ++++++++++++++++++++
 drivers/gpu/nova-core/firmware.rs   | 239 +++++++++++++++++++++++++++-
 2 files changed, 410 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst

diff --git a/Documentation/gpu/nova/core/tlv.rst b/Documentation/gpu/nova/core/tlv.rst
new file mode 100644
index 000000000000..8223605daa6b
--- /dev/null
+++ b/Documentation/gpu/nova/core/tlv.rst
@@ -0,0 +1,172 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==================================
+TLV Tags in Nova Firmware Images
+==================================
+
+Nova firmware images use a Type-Length-Value (TLV) format to
+encapsulate firmware components and metadata. The TLV file begins
+with a 4-byte "magic" header that contains the string "NVFW".
+Following the header is a sequence of TLV blocks.
+
+Each block consists of a 4-byte tag of ASCII characters, a 4-byte
+length encode as a little-endian non-negative integer, and a
+sequence of bytes, the size of which is equal to the length rounded
+up to the next multiple of 4.
+
+::
+
+    +------+------+------+------+
+    |  'N' |  'V' |  'F' |  'W' |  Magic header
+    +------+------+------+------+
+    |  Tag (4 bytes, ASCII)     |  TLV block 0
+    +---------------------------+
+    |  Length (4 bytes, LE)     |
+    +---------------------------+
+    |                           |
+    |  Value (length bytes,     |
+    |  padded to 4-byte align)  |
+    |                           |
+    +---------------------------+
+    |  Tag (4 bytes, ASCII)     |  TLV block 1
+    +---------------------------+
+    |  Length (4 bytes, LE)     |
+    +---------------------------+
+    |                           |
+    |  Value (length bytes,     |
+    |  padded to 4-byte align)  |
+    |                           |
+    +---------------------------+
+    |         ...               |  More TLV blocks
+    +---------------------------+
+
+Values
+======
+Values are one of three types:
+
+1) Integers, encoded in 32-bit or 64-bit little-endian format.
+2) Strings, encoded as-is and expected to be ASCII only, without a null terminator.
+3) An array of bytes.
+
+
+Common Tags
+===========
+These tags appear across multiple firmware types.
+
+``VERS`` (string)
+    Human-readable firmware version string, indicates the version of
+    the firmware.  Present in all TLV files.
+
+A TLV image contains either a ``BLOB`` tag (firmware embedded
+inline) or a ``SIZE``/``FILE`` pair (firmware stored in a
+separate file).
+
+``BLOB`` (bytes)
+    If the firmware microcode binary is stored in the TLV, this tag contains
+    the actual firmware image bytes.
+
+``FILE`` (string)
+    If the firmware binary is stored as a separate file, this tag contains the
+    name of that file, assumed to be in the same directory as the TLV.
+    This tag is always paired with ``SIZE``, so as to allow the driver to
+    pre-allocate the buffer before loading the file.
+
+``SIZE`` (u32)
+    Total size in bytes of the firmware image to be loaded from
+    the companion file named by ``FILE``.
+
+GSP Firmware Tags
+=================
+Used when loading the GSP (GPU System Processor) firmware
+(``gsp.bin``).
+
+``SIGN`` (bytes)
+    Cryptographic signatures for the GSP firmware, DMA-mapped
+    for the GSP bootloader to verify before execution.
+
+Booter Firmware Tags
+====================
+Used by the Booter firmware (``booter_load.bin``,
+``booter_unload.bin``).
+
+``DAOF`` (u32) - ``os_data_offset``
+    OS data section offset within the firmware image (absolute
+    byte offset). Maps to the DMEM load source.
+
+``DASZ`` (u32) - ``os_data_size``
+    OS data section size in bytes.
+
+``CDOF`` (u32) - ``os_code_offset``
+    OS code section offset within the firmware image (absolute
+    byte offset). Maps to the non-secure IMEM load source.
+
+``CDSZ`` (u32) - ``os_code_size``
+    OS code section size in bytes.
+
+``PLOC`` (u32) - ``patch_loc``
+    Signature patch location -- byte offset within the firmware
+    image where the selected signature should be written.
+
+``FUSE`` (u32) - ``fuse_version``
+    Fuse version of the firmware, used with the hardware fuse
+    register to select the correct signature index.
+
+``ENID`` (u32) - ``engine_id``
+    Engine ID mask identifying the falcon engine this firmware
+    targets.
+
+``UCID`` (u32) - ``ucode_id``
+    Microcode ID used together with the engine ID to query
+    hardware signature fuse registers.
+
+``A0CO`` (u32) - ``app0_code_offset``
+    App0 code offset -- start of the secure code region within
+    the firmware image. Used as the IMEM secure section source.
+
+``A0CS`` (u32) - ``app0_code_size``
+    App0 code size in bytes.
+
+``NSIG`` (u32) - ``num_sigs``
+    Number of signatures included in the ``SIGS`` tag. A value
+    of 0 indicates unsigned firmware.
+
+``SIGS`` (bytes)
+    Concatenated array of firmware signatures. The size of
+    each signature is the total length of the ``SIGS`` value
+    divided by ``NSIG``. The correct signature is selected
+    using the fuse-version-derived index.
+
+Generic Bootloader Tags (FWSEC)
+===============================
+Used by the generic bootloader (``gen_bootloader.bin``) that
+loads the FWSEC firmware via DMA on Turing GPUs. Also includes
+the common ``VERS`` and ``BLOB`` tags.
+
+``CDSZ`` (u32) - ``code_size``
+    Size in bytes of the bootloader code to copy from the
+    ``BLOB`` tag and PIO-load into falcon IMEM.
+
+``STRT`` (u32) - ``start_tag``
+    Start tag identifying the IMEM block where execution begins.
+    The falcon boot address is derived as ``start_tag << 8``.
+
+RISC-V Firmware Tags (GSP Bootloader)
+======================================
+Used by RISC-V-based firmwares such as the GSP bootloader
+(``gsp_bootloader.bin``). Also includes the common ``VERS``
+and ``BLOB`` tags.
+
+``CDOF`` (u32) - ``code_offset``
+    Offset within the firmware image at which the code section
+    starts.
+
+``DAOF`` (u32) - ``data_offset``
+    Offset within the firmware image at which the data section
+    starts.
+
+``MFOF`` (u32) - ``manifest_offset``
+    Offset within the firmware image at which the manifest
+    starts.
+
+``APPV`` (u32) - ``app_version``
+    Application version of the firmware.
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2749c196416d..888a426b7b41 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -11,7 +11,7 @@
     device,
     firmware,
     prelude::*,
-    str::CString,
+    str::{CStr, CString},
     transmute::FromBytes, //
 };
 
@@ -684,3 +684,240 @@ pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         }
     }
 }
+
+pub(crate) struct TlvBlock<'a> {
+    pub(crate) tag: &'a str,
+    pub(crate) value: &'a [u8],
+}
+
+/// On-wire TLV block header: 4-byte ASCII tag + little-endian payload length (bytes, excluding
+/// padding to a 4-byte boundary).
+struct TlvBlockHeader<'a> {
+    tag: &'a str,
+    length: usize,
+}
+
+impl<'a> TlvBlockHeader<'a> {
+    const SIZE: usize = size_of::<[u8; 4]>() + size_of::<u32>();
+
+    /// Parses the first [`Self::SIZE`] bytes of `hdr` (caller may pass a longer slice).
+    fn parse(hdr: &'a [u8]) -> Option<Self> {
+        let hdr = hdr.get(..Self::SIZE)?;
+        let tag_bytes = hdr.get(..4)?;
+        let tag = core::str::from_utf8(tag_bytes).ok()?;
+        if !tag.is_ascii() {
+            return None;
+        }
+        let len_arr = <[u8; 4]>::try_from(hdr.get(4..Self::SIZE)?).ok()?;
+        let length = u32::from_le_bytes(len_arr) as usize;
+        Some(Self { tag, length })
+    }
+}
+
+/// Sequential scan over [`Tlv`]. Unlike [`Tlv`], this type carries a cursor (`pos`) into
+/// the parent blob.  It is not interchangeable with a fresh [`Tlv`] view of the same
+/// bytes.
+///
+/// # Invariants
+///
+/// `pos` is a byte offset into `tlv.data` that always lies on a block boundary (in the sense
+/// of the [`Tlv`] invariant): it is either the start of a well-formed block, or equal to
+/// `tlv.data.len()` (end of iteration).
+struct TlvIter<'tlv, 'a> {
+    tlv: &'tlv Tlv<'a>,
+    pos: usize,
+}
+
+impl<'tlv, 'a> Iterator for TlvIter<'tlv, 'a> {
+    type Item = TlvBlock<'a>;
+
+    /// Returns the block starting at `self.pos` and advances the cursor past it, or [`None`]
+    /// once the cursor reaches the end of the data.
+    ///
+    /// The body relies on a number of `unsafe` operations, because [`Iterator::next`] can
+    /// only return [`Option`], not [`Result`], so there is no way to report a parse error
+    /// from here.  That is why the entire TLV stream is validated up front in the
+    /// constructor.  By this type's invariants, `self.pos` is always on a block boundary
+    /// into already-validated data, so each block is known to be well-formed, and
+    /// therefore the unchecked operations cannot fail.
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.pos >= self.tlv.data.len() {
+            return None;
+        }
+
+        let tail = &self.tlv.data[self.pos..];
+
+        // SAFETY: `self.pos` is on a block boundary (`TlvIter` invariant) and the check
+        // above gives `self.pos < data.len()`, so by the `Tlv` invariant a complete
+        // well-formed block starts at `tail`.
+        let hdr = unsafe { tail.get_unchecked(..TlvBlockHeader::SIZE) };
+
+        // SAFETY: same header bytes as validated in `Tlv::new` for this offset.
+        let header = unsafe { TlvBlockHeader::parse(hdr).unwrap_unchecked() };
+
+        let stored_size = header.length.next_multiple_of(4);
+        let advance = TlvBlockHeader::SIZE + stored_size;
+        let payload_end = TlvBlockHeader::SIZE + header.length;
+
+        // SAFETY: `advance` and `payload_end` are exactly the stored and logical payload extents
+        // `Tlv::new` accepted for this block.
+        let value = unsafe {
+            let block = tail.get_unchecked(..advance);
+            block.get_unchecked(TlvBlockHeader::SIZE..payload_end)
+        };
+
+        // INVARIANT: by the `Tlv` invariant the block at `self.pos` occupies exactly `advance`
+        // bytes, so `self.pos + advance` is the next block boundary (or `data.len()`).
+        self.pos += advance;
+
+        Some(TlvBlock {
+            tag: header.tag,
+            value,
+        })
+    }
+}
+
+/// The payload of a validated TLV (type, length, value) firmware image.
+///
+/// TLV firmware images start with a 4-byte "NVFW" magic header, followed by a sequence of
+/// blocks. Each block has a 4-byte type tag, a 4-byte length field, and a data payload
+/// whose stored size is the length rounded up to the nearest multiple of 4.
+///
+/// [`Self::new`] checks the magic header and walks every block: tags must be ASCII,
+/// lengths and padding must fit without overflow, and the byte stream after `NVFW` must
+/// be exactly partitionable into blocks (no trailing partial header or slack). After
+/// that, [`TlvIter`] only signals end-of-stream via [`None`], not parse failure.
+///
+/// # Invariants
+///
+/// `data` is a validated TLV payload (the bytes *after* the `NVFW` magic): it is the exact
+/// concatenation of zero or more well-formed blocks, with no trailing partial header or slack.
+/// Consequently, any offset `o` into `data` that is a block boundary and satisfies
+/// `o < data.len()` is the start of a complete block whose header parses and whose stored
+/// extent (`TlvBlockHeader::SIZE + header.length.next_multiple_of(4)` bytes) lies within
+/// `data`. `data.len()` is itself a boundary.
+#[allow(dead_code)]
+pub(crate) struct Tlv<'a> {
+    data: &'a [u8],
+}
+
+#[allow(dead_code)]
+impl<'a> Tlv<'a> {
+    const MAGIC: &'static [u8; 4] = b"NVFW";
+
+    /// Parses `data` as a TLV firmware image, returning [`EINVAL`] if the image is malformed.
+    pub(crate) fn new(data: &'a [u8]) -> Result<Self> {
+        // Verify that the magic bytes exist and are the correct value
+        let magic_len = Self::MAGIC.len();
+        if data
+            .get(..magic_len)
+            .is_none_or(|magic| magic != Self::MAGIC)
+        {
+            return Err(EINVAL);
+        }
+
+        // The payload is the contiguous sequence of TLV blocks after the magic.
+        let payload = data.get(magic_len..).ok_or(EINVAL)?;
+
+        let mut pos = 0usize;
+        while pos < payload.len() {
+            // Get the next TLV block.
+            let Some(rest) = payload.get(pos..) else {
+                return Err(EINVAL);
+            };
+            // Validate and extract the header (type, length).
+            let Some(header) = rest
+                .get(..TlvBlockHeader::SIZE)
+                .and_then(TlvBlockHeader::parse)
+            else {
+                return Err(EINVAL);
+            };
+            // The `length` field of a TLV block contains the actual byte length of the
+            // value, but each TLV block is aligned to a 4-byte boundary.
+            let Some(stored_size) = header.length.checked_next_multiple_of(4) else {
+                return Err(EINVAL);
+            };
+            let end = pos
+                .checked_add(TlvBlockHeader::SIZE)
+                .and_then(|p| p.checked_add(stored_size))
+                .ok_or(EINVAL)?;
+            if end > payload.len() {
+                return Err(EINVAL);
+            }
+            pos = end;
+        }
+
+        // INVARIANT: the loop above walked `payload` from offset 0 and only stopped once `pos`
+        // reached `payload.len()` exactly, rejecting any block whose header failed to parse or
+        // whose stored extent overran. So `payload` is an exact concatenation of well-formed
+        // blocks with no partial header or trailing slack.
+        Ok(Self { data: payload })
+    }
+
+    fn iter(&self) -> TlvIter<'_, 'a> {
+        // INVARIANT: 0 is a block boundary, either the start of the first block,
+        // or `data.len()` when `data` is empty.
+        TlvIter { tlv: self, pos: 0 }
+    }
+
+    pub(crate) fn len(&self, tag: &str) -> Result<usize> {
+        let tlv = self.iter().find(|b| b.tag == tag).ok_or(EINVAL)?;
+
+        Ok(tlv.value.len())
+    }
+
+    pub(crate) fn get_bytes(&self, tag: &str) -> Result<&'a [u8]> {
+        let tlv = self.iter().find(|b| b.tag == tag).ok_or(EINVAL)?;
+
+        Ok(tlv.value)
+    }
+
+    pub(crate) fn get_u32(&self, tag: &str) -> Result<u32> {
+        let tlv = self.iter().find(|b| b.tag == tag).ok_or(EINVAL)?;
+
+        tlv.value
+            .try_into()
+            .ok()
+            .map(u32::from_le_bytes)
+            .ok_or(EINVAL)
+    }
+
+    pub(crate) fn get_string(&self, tag: &str) -> Result<&'a str> {
+        let tlv = self.iter().find(|b| b.tag == tag).ok_or(EINVAL)?;
+
+        // Handle the possibility that the value is null-terminated.
+        let bytes = match CStr::from_bytes_until_nul(tlv.value) {
+            Ok(cstr) => cstr.to_bytes(),
+            Err(_) => tlv.value,
+        };
+
+        // But do require it to be all ASCII.
+        if !bytes.is_ascii() {
+            return Err(EINVAL);
+        }
+
+        core::str::from_utf8(bytes).map_err(|_| EINVAL)
+    }
+
+    /// Returns the `n`-th fixed-size chunk from the value of the TLV entry matching
+    /// `tag`.
+    ///
+    /// The value is treated as an array of contiguous, equally-sized chunks, each
+    /// `sig_size` bytes long. `sig_size` is the size of one signature.  The returned
+    /// slice is the `n`-th chunk.
+    ///
+    /// Returns [`EINVAL`] if no entry matches `tag`, if computing the chunk's offset
+    /// overflows, or if the value is too short to contain the requested chunk.
+    pub(crate) fn get_nth_chunk(&self, tag: &str, sig_size: usize, n: usize) -> Result<&'a [u8]> {
+        let sigs = self
+            .iter()
+            .find(|b| b.tag == tag)
+            .map(|b| b.value)
+            .ok_or(EINVAL)?;
+
+        let start = sig_size.checked_mul(n).ok_or(EINVAL)?;
+        let end = start.checked_add(sig_size).ok_or(EINVAL)?;
+
+        sigs.get(start..end).ok_or(EINVAL)
+    }
+}
-- 
2.54.0

