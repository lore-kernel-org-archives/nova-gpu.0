Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD03199FAB
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113810; cv=fail; b=sJl8hZU1OhcHsbAfS/06y5gy0mp37P/FPMGbF6/8TMnVHrBYfaXmJcJv0SwlBleLc84ya3uoGKVtj34Qr2wT/FW8LuMoxx0lzj1DE8vuIBx62UhBsLJDAiydj3Nn9O3Z7mOiMIkOEZlLJlAnpFW86Mqriofy+d9Bgkr9e7qxaR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113810; c=relaxed/simple;
	bh=awDulsUYhds/wyisbTQ2XzSrlEeZTz9y+yF5MalhyVM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V1sdPEY0NTvGNA0E7rV3rPqavzKJA/inuazYVnD18nyI5ZSKBKH6rSPRqumrGwPh9WuBM7yKb2L8tYbyrElWMaYMt9OR+jyqAoh34sf0IAfhh30PVij9YUNDuVts3vI30q1eYAk+NffHwL2aPzOpqkeY0/rPShytOXVyUYFUqbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eipoqOLU; arc=fail smtp.client-ip=40.107.208.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eipoqOLU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDRqtBdmkVtxtsrXsHuIBon389bHnXc7TUo6sQc6LRuAQPtWd3lWHcaoOTePnj2gcVE3n76EapucMY/2qqW4MmgKI+0csnio/+pTppvK+QzmAEyYV2aLiX4PnsG3w0wkoAHOB6d9ScPv2s1CrxlZBQQi/Xtg/NWAzCN5YecRA9S7sC1O1k/WqRnDM57mJkS1jk+D3K+sBQl5ZiTtNJOoM5MP6E8u9C4XQt+EoI5FnM0S3R8Adk4MfOC14O5iAhr9QXupFZ2TgysJtS93PlHSdpYGTvC5aVGwxOaGSHwcwwDeDGn1Ds+/B0T2la/4F9MDAbSigr3onnmXphwa/75AxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9pJ1F6cZfGpRE9H8oDQFL189rnefb2OumxpM4gXL28=;
 b=K2Ym8MvlZO3Vgt767fmpwq4qEuOBKggUeav03fq9G+0BGGl82/9KEKmdUKSwXjQWw3TpLXZEd/tCboSb5I2+gKbuQE6K6i/YN72QJxYF/d8Ti4sn+AozYmW82Qb/e+kXS8GYJka6Bj4GlPDPOm/aOzUB5vN4j4GQxcp4qSxBH6H7u9+txzPyXAjdoHhi+QvnEYkAZfGWO4hTil3R9mooAXGx8YtmhPH7pRdSkdDjp5HI+TmXM37oKBtkAgdihB8ZSBcQClqQBA9UGZ6URrDo7pKn/BTWcxyA8L59CBZjg47bpEPwsznn1fTbG9TbtZbwDHrCmzOKAFBQNM6Qxg3Log==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9pJ1F6cZfGpRE9H8oDQFL189rnefb2OumxpM4gXL28=;
 b=eipoqOLUmjysA8FmocRK0XHUjT0NbUehw0sStpuchgaT6yyImS6VHU7KS+dP0XFL2H1g8AdlCIaQGkrlF9jmb9JCYR4RbzpvNaO+0R+igPFBS2zXF8xsgifRl23tVKG2X/R/3k/wrxYnstoBWSB/s6FiXkaUZQ90m/0aJgEjlPm4PEi3VxJiZzVoz5GeSk7OooOTXpi91XhYQoZ5Tz3SfvxbAshTT6O8BNeIQu+0sM/d2gdKIRlA8I5fFXl7F8yiW+5RxymlGDTGpJB1sYQI2dlYYB3SVKQOdVf5ooEYZ7LKKPoDy50UabJYUtRIKRsjm9nZtOFa/nYok29hmp7QEg==
Received: from MN0P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::10)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 17:50:02 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::57) by MN0P223CA0023.outlook.office365.com
 (2603:10b6:208:52b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 17:50:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 17:50:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:38 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:37 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	"Alexandre Courbot" <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>, Eliot
 Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>
Subject: [PATCH 0/8] Transition Nova Core to TLV firmware images
Date: Wed, 10 Jun 2026 12:49:21 -0500
Message-ID: <20260610174929.744477-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DM6PR12MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: f670b45b-d4f6-4a01-f025-08dec718b213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	yDDBudg2Ix0d1ZP+Q5ESSYbnShapimLSa5sDL1fOsKW/5dBy7+2atO5DP6Xl1BYfngKf2TAj89W2RSYfm9oA+A+xvvdsk8IG3AaTosGkU4SXIuKEs+Oku4HWRLERtL2j+SB5TyJPJ3LuEjyjJqSx0lv9bqyM0fEx31KDNr1iszv3PHJ6ZSgBDmrotzKvNRZ2ahvzUYzXQJDyQvwLgKGFjD7HroaMDXor0MpEvhopX4PBxl/WvSZ43HO3bQ2xJ0ppyWDRn5/C0jLX+zcXpAJE83uyyF4g6gIfgLNm5AD3/gLFCf0qQ059KNSO/JQPyeX5KEYlKYQf+CVM4aIUU4I5gS+eRNsjtXIgplre/PkEP6Xapuk05mVcFdrxlxM6M1rMS6Tb9/IumFF0w1SOxxmYaaIl5jTevLAdUTQCwAlWX47Hv/q77isTOLX1+eYMjhwEDnbcgVXtvBR9dY9pLU4VcBGx7h3TlUA+qP/+rHlT/1ej1DTa/OiRWoc1VUTtaTwWpNgldkHccqaBn94Lxi1np9iouynAS1YUus7ZUGai1MKPGBqiA/kuJxAHdwg3tskB4wPptvL//zdOoEJwYubtCp66HhVefpsXiYCMD3hSGHMmv5xh8oDW2OoP0DiWkrsSjiJT8rJ4TwAFhHIV6xoxKFbqa7FsQU9rvbeHqlk8EJ2/ORktr0mN7lp2vZ70XKtph0Td52RbDADIbXiC9bNYjy3hkCg9KEgxSo5RrYtXf64=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QDF+b2wY07ITmnPyTLxM1s2hXWa9e335G1kMxjGhai6aNFBdcnZdPR1//53k5xObhrJPsoaWa2fociQ0kbekn8H/g18f5SnZzZiupuUYptO9UDFvGX5+HyrdCUS8hSwdnvGtAzmxa1UZLMaLmxd4TOJTL5vIKGKQRZjG2v4OU03ndY+6gQ6stbPo1Ht3OnvT4bOXdC/eJ9ezjIBOacxbF7nsHNSAUGh0I2NwhcaKJ85Cria5hJ7L/3RgC3mJEx54NFaHguRz1PkQi5sCsVJsMmVa0ccbanC4QoWt+hI3X7GTSAAUMldyBSiZx+sYAM8r59sW1xddmsZpLQlVGynd9bERYGh/uhvECk3/PacA9T6jOKbCpDIKYK0MNRsWZo3ERwreHjY3XGcMPWr1MFnrGJOOQmaLyGXdKtf9oex5oF9r4neFzNmRn3kZMBT1Fbvr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 17:50:01.2099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f670b45b-d4f6-4a01-f025-08dec718b213
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188

This patch set transitions nova-core to use the new "TLV" firmware image
files, instead of the ones that Nouveau uses.

The current r570.144 images are a mix of binary headers and ELF files that
are cumbersome to parse in Rust.  There's a significant amount of code
that just reads in a struct, extracts some offset, and uses it to find
another struct, only to have nova-core use just a few fields.

The new format uses a sequence of tag/length/value fields that can be
iterated over.  The script that generates the TLV files,
extract-firmware-nova.py, does the extra work to find the specific metadata
needed by Nova and packages each one separately.

The TLV versions of r570.144 can be found here:

	https://github.com/ttabi/linux-firmware-nova

along with instructions on how to install them.  We are not planning on
submitting these images to linux-firmware.  Rather, if this patchset
is accepted upstream, I expect the small handful of people who are
actually working on Nova to grab and install these images, which needs
to be done only once.

There are still opportunities for improvement.  For example, I would like
to get rid of more GPU-specific code, especially the GA100 quirks.

Timur Tabi (8):
  rust: firmware: add request_into_buf()
  gpu: nova-core: add request_tlv to load TLV images
  gpu: nova-core: add TLV parser for firmware files
  gpu: nova-core: transition booter_load to TLV images
  gpu: nova-core: transition gsp to TLV images
  gpu: nova-core: transition gen_bootloader to TLV images
  gpu: nova-core: transition fsp to TLV images
  gpu: nova-core: update firmware module info for TLV images

 Documentation/gpu/nova/core/tlv.rst           | 172 +++++++
 drivers/gpu/nova-core/firmware.rs             | 451 ++++++++----------
 drivers/gpu/nova-core/firmware/booter.rs      | 328 +++----------
 drivers/gpu/nova-core/firmware/fsp.rs         |  84 ++--
 .../nova-core/firmware/fwsec/bootloader.rs    |  72 +--
 drivers/gpu/nova-core/firmware/gsp.rs         |  56 +--
 drivers/gpu/nova-core/firmware/riscv.rs       |  71 +--
 drivers/gpu/nova-core/gsp/boot.rs             |   7 +-
 drivers/gpu/nova-core/gsp/hal/gh100.rs        |   7 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  15 +-
 rust/kernel/firmware.rs                       |  45 ++
 11 files changed, 575 insertions(+), 733 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst


base-commit: 9eaff547805f8556992a9474465001c3e128b7bd
prerequisite-patch-id: 0a9ea098bc3576171da9f6293065fdb4db552466
-- 
2.54.0

