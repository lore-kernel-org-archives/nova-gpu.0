Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012045.outbound.protection.outlook.com [52.101.43.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6674C1BBBFC
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 01:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140751; cv=fail; b=hMZDpoma/njl2k5LLTKjP0wBDQx3ba2W38UD0LdUT8dkmPo9Z3eNckJwxek/V2Q921pahNonXuhLBHLnH/cWCwmVDAH57qvC0IMIso91mJ3C/kXm3BLM2MjUGWZDpvSop1b4fI5JLFAIT88oOBPUSVd7GbgOZULAw1skzvWaQ7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140751; c=relaxed/simple;
	bh=25/fXs0qhWwfuQ2aU/+m/E6X+/8xG31/r4rXMqgCmT4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Qc8wj8LLg/qSQpv1kX8S+GeC6kHQDninnt3lTSS8DCHJDh6o41jjduEm+tUFfeedpItqoiC6SF/zNHlz6e6Pl2l93jHvkdBvcSwC8grU3CUYBCsdngUeBgTYtCLaeYYyHjJnrnHZ2l78oY2qIURk1lm79cBMTMtd4Ige0cnT+hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VAcXGdu8; arc=fail smtp.client-ip=52.101.43.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VAcXGdu8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXxw8oVtkq/R9hGbuBYD6t7lKCAaHOto0kzv+I4OjqUFAv+34CaOr7UVPbjsHwM3jX4kcS9BLrCwXvtsWPbi4ssROi4ozG1ugUmPslhFdG+bl1O1XGJh6zZIV0t+e3agBlo73REEaQSZ+pMryXZxVxRn6BltyoiCwJIBscIYQ3QaaRsoWCRDyFDF7mO1ZJ07jUIKxzkFdeFOJryP51j1por2K4r3eLbBMugeWMwF6URC75Blpo87Str/xr71rFrKGxs6NVaM98hyWH4uhJlI/++gNpDJ2xAzZm3osWDdgQex8aygbnSx4VKmhSW0/UAyNfZY2PGDEwqMDbb8BonZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FVqBrxw2X44WdyxqG/GrCmQSIlRFbHdFs+6wIficsk=;
 b=QuypVoI/ueZK0rVj/1msNV76PGfvU0sT0Ju+nFWThOQ5wqXGBBMnBXIGG0YpvyycoKyeelQSK+/NSqq/Bnv/nA5EQutoEisK+3Zg2OtlTf+K0wLB6fTAv2ndEQAZ1wQ348yBWDTGX+swWRsd3ZvZgkjYD+JycZVdm/ZZZ0gRnVravzPokNO+XVIP+o0Jxij3oWs2P8tEGGvxAlvYovenjI0qI2qYExDYJKfKGeOU7MiTfDZSSnTUGuy2xgzmSG1I63g8vWCQaCYMRmMZAqvmdRzPGPRuz3nU4y4lnDFAolAn3WxVJI9yyUkPFkKCAHrr0oQdwtPVkcTmh7UrtoZGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FVqBrxw2X44WdyxqG/GrCmQSIlRFbHdFs+6wIficsk=;
 b=VAcXGdu8sg1TWvXq2au/dAzeBWwfG9jEzrY3X4sgusOBy2OWntSB1A+nLNv563MahWk5GiRtOaOh0jRa12dKRp060RZMv7Z5tKYl1mD9z+i34Iyhovtu5ddt3EJPdOqOH53yLAyyNRv+pUFeu2/dt+Fkj4M0LSzTX8pm6TlHET56fMdnpmYIfWHLpSeVUF+nhceEOT4wenRYMEyIy0mzWgjNgNZBOfRyie6K3g7sFmOumuMGon8ttWx1rUKtQsMinOFf38WgX3opuXp8Fz3ZnoFcOMSoOP2I2iKJcw7pzV/GJrXNSncf/X01rjblmh69wSsp777XL7Bg95vSQhCo0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.14; Thu, 11 Jun 2026 01:19:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 01:19:03 +0000
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
Subject: [PATCH v2 0/3] gpu: nova-core: fb: Hopper sysmem flush fix and cleanups
Date: Wed, 10 Jun 2026 18:18:58 -0700
Message-ID: <20260611011901.84517-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e0d36f-691d-4c9f-0753-08dec7576c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	6U9ObXX0c6bnfF0gYzwVaY/wf881pf4qtcEpeZEmC5xAzOMOitlJPwRJM9XpBfXZAs25BcilwBah7fL+uBU2tstQa8z5IceD5v13WvEzLp0T7yiNVhY+WQZ90C3RNzUwtli61JRM52FULDsM60oZnxZIscDQPdSEyD6H2Aso8OXNUKWMcW7sIq24gUd3Fxl5x4SSCm367y8hzN9eaa2CrT4PONID+2DX1L1aWPwYAz2BT9FJeGA1nXOMKZiXR8zqK0vvXxIvL/HdKjOJaiQM4xSGLPWPJRqaUaooeaUvh2DboLiZQA9qEiM0pJ3fIrxxbmCH5fGj5vL28BNvYx03lkcPgHfo/aaunhQUY6+RXZVIe5Au2a24UkEP2T5rtpgtujJqk3XIM+VUBZyp1AdgbAIaApdv31o7EJQTDCfDustJlLMHEGWc2QnESg/OMrcFsMny6c0TolzFaLEoC01aghKPBaLKktFjQ2Jus/UY8FfdSFJsyPFSK160ZOWaTJV2nqiHYARy5rcuS/lhNH71qWKkxYX9fkm6HEWuBRZELvm/gGt7ON2MCFN6xzuxME9ghO7arlljkC3bZ84rzwjuQ78rCWA+SRvRI7PaayCjjljcsltertrH3VMg1jF0m060OlsiFtFoaBXMU85iKrzF4xPbRxNrUTkSjE0uJ0Hz08DnwZyc43k1NfciZzu7Wi/M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K+XAtiRpPLkbl8IclNKWsAney8gt5Xb79uz9PFYTJCDQt5PtVc2e2yvaXOr/?=
 =?us-ascii?Q?X7/LhE8KwceDa9RbFjjDcgnETFnA1UXUsm/hpryxZhMD+qguEXDYGQOCVIli?=
 =?us-ascii?Q?JvEsHYzneTBe50JAlN52T52aREwB+ahdYfMdlHkPYkzkonKpi6bJYPVMs0j+?=
 =?us-ascii?Q?oSp36vmrqv4fB3Uq82wxNwsPJ5HJDRJ009Ui9BGBtcjctSkG+Sq7cbT1MPbn?=
 =?us-ascii?Q?DUuHieSTUKNAG+2zTgXS6tXZNCBlsb7UL5K/B6H7sHYWZ59e8ZAGc+lDtDnJ?=
 =?us-ascii?Q?e4wxxK0EALTtVKK0AU7MNSY4Zy2wzwSb+FrAmvSi3Yx4Hvx0k+obv/th6JBg?=
 =?us-ascii?Q?Iy0d3voi2lkWtYjURboyDKN2rLoS7/lbMxI5/vB43tsvex9V4pw3j/5+rGij?=
 =?us-ascii?Q?Ec5y9dcyJNIQyJpmu+2zoHzNmkwatggHCYEveVI1NNmFmenzZsjKcyULTcLA?=
 =?us-ascii?Q?kWvlHEbbjkuPAnCbPu8GE1k7+lUPZX8NlhGj2+CUddn3gjImDCAeo3aTcg1l?=
 =?us-ascii?Q?GRBNz/VXKi6sQIo9006jndOrJiotXnqRi+NEAfjjhys//wUXMvZ4QaG7O9ab?=
 =?us-ascii?Q?TYIJmfED53l16nves7j8pS9bONkQk0thfkH3Ys9wKJjVaX21Drihuy6OnYu8?=
 =?us-ascii?Q?lJP89KGZb4IETRSJdQprnlc8MXBAvZY3ChguulkVkHpvo1F/rBu4so9yQTTS?=
 =?us-ascii?Q?OxIQkwAN27lTfEFnyKLLmImBGrenVE8CQUpJ8LTx+1mqE+msA/lE1fJQxATc?=
 =?us-ascii?Q?p99sc2tusXxGZCr2/ilpGIkzYZipjmiC1QmwEqGiIeeWB6sFUQcIY1Hpjt7I?=
 =?us-ascii?Q?CizUreOaFIkpeBdDwP1eZRU8IZq7ZMlceezdR3Z/hqWuaFHXs/QUm+k/ynfC?=
 =?us-ascii?Q?UubMS4UX/9g/jmzZeq/Id2UCFRZkfnmu6eQJFOEjyv3f7aAQTFC0cAYLqcZZ?=
 =?us-ascii?Q?JAX49rz7+U8OWZyhrbqsTxyWJTa5l8+92yFuUqgXyyihV3fJlw2KjeaWA7vv?=
 =?us-ascii?Q?jjWA3npEixF7f7Mm/fNjF5Kgr9kLbMsCkRLeQnLzUFHs70XKvSjyKQmHgFO0?=
 =?us-ascii?Q?gSkW7QWWvEYDq2CRvVF9GYdxAdOx2SKCYYLfMdWuH77laS+03usYkhyiLG/M?=
 =?us-ascii?Q?RJyCTbm9woiOUO34m7oXgEwuAj1lRKVjw6f49pMltVXjgN5/QafeVDbFOOTT?=
 =?us-ascii?Q?srfeSFQ8S41fpiMpebByuKONpNs5q9NxI7kxAXmzrrrPQCDfxbe9T/MVhqF9?=
 =?us-ascii?Q?Rxlf4XThBOrzup0v+Djh2GRQ2BTS5sBRDsJdAxiaPOiNNODlOKUySFrvLV6E?=
 =?us-ascii?Q?OoC5rJ9N8ouc9zz4dQrv9KihLP74BH7RPYdHBRk0Dj/ziz41P9RrMyxX9Xkt?=
 =?us-ascii?Q?sLgWztz+ksZ8fOxCg0ppJe3d3mXml8IiUuKNEUri+lZ2XgWmPflwApzp1w9E?=
 =?us-ascii?Q?IcXUTMRl01f+p+O6wJjyY4bAjdZ4ZeUhFqvN4QPH+IsZVWiX7H8RSJQabKkR?=
 =?us-ascii?Q?ichNWeKtlK3Lors2ON/A6Qq4wYEKRY293In4Lrh9VZCZqvd/JFw+nr/iGj/3?=
 =?us-ascii?Q?P1adXOp/zwwb0K0VPIaencAVPfD89dq5jR5LWNNvH4GrbBCxU1G0ZrA9Eoy8?=
 =?us-ascii?Q?m8BJcqLeNqxIQov8+vaHsIsxX+hxIAFXo7JQO7nWZC7TtFLEzlrAFqcI+Fxo?=
 =?us-ascii?Q?rSE2E0mM2pSlJvHtU6xCCeQ001tmbb81oKPR39S+En3nwtfnx96q6PRAoF7M?=
 =?us-ascii?Q?HSah4Y1+vQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e0d36f-691d-4c9f-0753-08dec7576c99
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:19:03.3376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34APta0e8CtCytLpyO4MtffzfO9L25F4ho98qkFv2ZCU/O3eMKbWQbVaFbeE96UaxjC4j8GBIgKF1YUAdtcInA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053

Changes in v2:

* Split the original single patch into two: a no-functional-change
  patch that makes the GB20x FBHUB0 flush registers absolute, followed
  by the Hopper fix.

* Made the FBHUB0 registers absolute instead of relative to a register
  base window, per Alexandre Courbot's review.

* Dropped the "clean up FSP FRTS comments" patch, because it has already
  been applied to drm-rust-next.

* Added a third patch with two tiny readability cleanups: compose the
  Blackwell flush address as (hi << 32) | lo, and drop a duplicated
  SysmemFlush doc link.

John Hubbard (3):
  gpu: nova-core: Blackwell: use absolute FBHUB0 flush registers
  gpu: nova-core: Hopper: use correct sysmem flush registers
  gpu: nova-core: fb: two tiny readability cleanups

 drivers/gpu/nova-core/fb/hal/gb202.rs | 28 ++++++-------------
 drivers/gpu/nova-core/fb/hal/gh100.rs | 31 +++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs         | 40 +++++++++++++++++++--------
 3 files changed, 64 insertions(+), 35 deletions(-)


base-commit: 550dc7536644db2d67c6f8cf525bba682fba08d9
-- 
2.54.0

