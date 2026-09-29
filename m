Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE83B83E0
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790716095; cv=fail; b=duHss2u0O6OKtBWFtVRYcI5OGWfOcK+7m2swRHC8tVsgRIkdofLwml3OQI+Doezs5hzX3IDALbBIOF8ee9gVo++FcWrBOOBCtJRn4swmT8psYSRaUK7FHVWPnRMvSDSbI02DlGyclvjf9AOAAhTstGk+H7ZrkblQlHqrNThHNtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790716095; c=relaxed/simple;
	bh=UOyC1bDurSt1+LFvfcDWGGe3PRi7fuDegrBS8YpekqY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=t9VsZ0DmQEgXkGrrzEvELn1HfOKav/I51mx5UhnaG5d6kR4mdbc7cJABlKUuFp9VVrfsO/YjzXAaJd/Mxkr3rnKHujR/P6Ua7Hm/W94j6WxqajHGKu+u5/drMbXEQUeMz1JmZIbySf4mE7Tp/HK8/1lEwnW0xVpjJn0StkVXyto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TVuVxOn3; arc=fail smtp.client-ip=52.101.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TVuVxOn3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8gS7T+bAg9tbgsqLssCAGbGZQe093BI+ACXTQ5SrEBJdlw/0UXeCNazcIZGgAUSLPf7dpfCCuD1PabA+FT/rVNTg38SOPhc6BmkJcyMZj+MjyblEUyAp792B4OhLqm4Xm3WZ53mmtW/bdpcUcb4t6s/NqNvAMnza78dzs6GUxKyoemKIaqEdovjwdUAJNkUlcZse6etdjItRo1IIM4K0+ki4VK3GQY04HOXpnOKQcu00hZpTxo98sPrF/khMKAiLQmuUtiSAxz7OeJ3Vx5dq2jKCnqnoP+Y8Eb+AT3oweBVjXCo2GJNwffVElcJ56S0Q7nt/C/Vo/8Gb8P/ttIRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpgA33wezq+LWEQVgPUS+xB2KB/OhqBFEXhZTNghez0=;
 b=Rqjdi2vRm+ZqvO1gzFNjMDCmcrmCUhPlPUlOw4hilrd7HWxtvwJXDoxmlia3LtyyLROgauxDg6iS3Mlwc56YSG7OOGOxVC0locLF5sj4O38gHeDpgkfbpL/Wf6eG1hKO0XBaVq+L9nxhJvO2BIapPb8pluPnNL4tzu+9lpaltXGom1E+5d5adnvqTYcPNU2CNPP69tiuaQA43yBI1v5fB1/TtOUE08tn2cwB4riq6LbkymhDtzf3yVzJoPTxLpYPfael7a8H7hg8v924Kkkdbpw6U8vpCRDaFemSKhQh0q+sy4ZV7ud1rWVSWy/fcR2EZ73XB3bDErgnSJZ72NkTTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpgA33wezq+LWEQVgPUS+xB2KB/OhqBFEXhZTNghez0=;
 b=TVuVxOn3j08HUgwSwCiyK+QvTqnNgp+EEyfhZVDOXlZw3IZltpHPBQ3w2TdaXgoHqm6VDjBazZD+WuzfWssUXQ6TLQw2gyf+ty6smn0ijkmPin1Lo8J2Ljo3yoVIzBuceS2G1qADKEC9EcFeWH5RJQkNGEQcA5fMtCS18vALpqO1oEQd8LLqx8shl1u/a3Fm9qtn7y8nMD5hNFt0RpIQ23vX6YabrZXb4r+Lqag6GDQSyurKgea5M3VXBYcHPz3n9Gclw/s+GPOShB3ob7LtKJJfUwEfqP6wESKs7dDHYkgY7ao95Y+xSk6oN5tGSAXHthHWgiwM/J7C2x8vUfDt2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Tue, 29 Sep 2026 21:07:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 21:07:59 +0000
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
Subject: [PATCH v2] gpu: nova-core: restore the "Probe Nova Core GPU driver" debug print
Date: Tue, 29 Sep 2026 14:07:49 -0700
Message-ID: <20260929210749.409380-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
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
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e22079-2e28-4b36-f64f-08df1e6dbddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2IKJp7dMCNg/eJJOAIPy6ovVhtIPPYGgIu0vZx6UH4WVM206eu2aIJPT9J1I6sq9mqMTniH8AIdSg4UtfZsT2LsnbPI5wfclMuyiJ1iihCQKDd2PAY9s8yNcVm+1b3O37xB4NUWn/Nj2vex7fBSHs3aHJBbijEStlXW7D0NlyGivVrMGOH/+fhc+ouA2/znGBEE4V1RHek63pnVW+3zSsWkZAg9/fhlaBIhaJWRgTMvaUfbRCa+0ATo8PWPt2XTtGb4r1SrfA1khWw/ROaHp+LddY4m6F9Ky4VFO3uC4GPnW45hFfpwX4qOtfN+yhuhZH4/mI+hef5i+fzyhaVxezWbmOi8TYIQ5CsXNLMDzfJ6nQL4eDX3SAXeQen58N/u2WkSOEGYeq3KblukbTGXAsspf7VX3v2zOiywGTcncVaiA5NB5cCbmOJJYK5uMALyQefrpSSW71A0qWBdchmVgEgdBJ+5/UhUioVREaxyQqkNXaTPwx7iaAx1oVYqLlfRF6H1dScsKGvVysXetbiw/4sivM2Zk2ud5+Fk/ofV45eVShzXAptPxlPeqUx6X7epxAuugteo8atK0Hio2KR5QRhDO8xD2wrTytTIex4SrEw/WJY7wrsgbcyGL59fnAUyxrOXlgJlVlT/a3xte2lmYDsNBjtcnjSUMkAFrurv63Yo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C/p0nhYPmhNqdGGQ5Pt+dN5bN2hg7ybAASpdqQ1L4iF8lDVU/ENZVNrLl8jr?=
 =?us-ascii?Q?73bRTZWdXf0dpv9ecje05bcQvtB9f72Ph0wlUsoGD/gcqTUrJcjfzgSWPjEv?=
 =?us-ascii?Q?8pGg85I4cROtIEWiLZyLN7LrUtP3Npa08u6LzglpWpB5bmyYWQposwkDpiS3?=
 =?us-ascii?Q?u+kfphsxPwn2RcLcTJJfJjb01YZ3TME4PG5nG1IQVWTUJr/lLbzRg0GC8TGn?=
 =?us-ascii?Q?NS1JycBtrhkWvPRReEMqze1dq9na+J1A6kVkiqhgOYH+mLM0INJh6R/HL78d?=
 =?us-ascii?Q?sJN7ghWGCQmZzeVLIel2Qa2WrDfl+JfU19A1jRSHY051PiXMZ0SxdDeJPj3X?=
 =?us-ascii?Q?HDTtmrGx3mE1PCgznQ4fSt1RQ9iI2BoTRdnQ7r+1MzQASaUyJr8gNqtG1pbX?=
 =?us-ascii?Q?JzONa9BLDUu6ilqcLfthxORhXXu10G2OyIoTfQia8YHKdK7kR5+g+7iFKDwT?=
 =?us-ascii?Q?M3wILOkFNnzLYpbqCiKe1+97aIK4EzMhpQ7qcKjD1XqbOp4YQduubwDvg+AQ?=
 =?us-ascii?Q?xMBhEpH/ZABOQtCPDGHNy56WKzzKYitHD9O/uYX407mnqPBjKQDvDu8fRZrL?=
 =?us-ascii?Q?nX6szT0aW7ttwjCtzdDCXUD8jHao5RTIH2EYz9fYRoRF7wCfyrvrCyeW8BiD?=
 =?us-ascii?Q?zdgzAhNmU3R5oPI8HJ4B1CjtmwBFs1Hz/j5Qmj6RN5UyxSt98ELDuEuXNfZz?=
 =?us-ascii?Q?k+zKnExdkio6akEd3dpWqPQg7/dGzXm1EYmfVkIjJbwk6r8oNkaTZMBPzKEO?=
 =?us-ascii?Q?t9RMPgxn4lD//6C4uFc0aV4g5gVba0kK4osp9hU71vhEq5MpKcrPvmHD9E5S?=
 =?us-ascii?Q?FQZt/GGsROTTaZ4AsvcRxtwekbyyJFpyTaUAXo+K3CTB5+3dbAfy0irXHkT/?=
 =?us-ascii?Q?5yQpKbtRvbP8d6zXdNDAPUYYFNGJZKZVjdmbiv2KFmn0wga1LHX2WX6buq+0?=
 =?us-ascii?Q?EkccYPONfPlsqLJbGyP8JtRXmNIy8PedA9KUBZGcpkNIz32ZuOG9YMLhJXT3?=
 =?us-ascii?Q?WmwNBsiRuiyPlku1ln8K3szhe0zjwqfW898zTdM/fIjHt67FVEGBTlAeKVbz?=
 =?us-ascii?Q?kkWAO09INhCvEnjKqoHxfAuHgynjpxrh94yLhJTOZCss5THH4ujjuIoHjlS4?=
 =?us-ascii?Q?ENsTYMzKYW7EjNFHOikJaogNQZn+27juxEBXUQ/rzC6lmdIQSEzKs3JLNQgT?=
 =?us-ascii?Q?qZr5syPARBXqK/g7dKVWhYLZ0WHywSP1Yi9d3zIkrN4Edt3N3W+kEaQJujnQ?=
 =?us-ascii?Q?j6hzPlrXwG0YzIv/NW1iNyETVnhAORbH739w4y2iCs+V6ui2i0eu+O3WmBiL?=
 =?us-ascii?Q?5dt/5WWek00eoPEtp0IHigfUYHNdLrBK8o1HVGQ8PjlzPZLn5/1r+bymqHLh?=
 =?us-ascii?Q?lNy890GmPhbJbMVOsi+c2a2NVZdP23Vo8LJn0RY4rt4RRm48c4f2AMukNHIV?=
 =?us-ascii?Q?0h7lVv8lux1ANXIc/6LdnjlR+K1zeVXuOyEQ8joqZzjMaVn4F1L0tBmWRvDs?=
 =?us-ascii?Q?acGXrUTNQnZTp67z7MdaT8f8MjLv2iebHrujLLdUp86HX9SekYmnxizJW+nJ?=
 =?us-ascii?Q?5cIEA5PlDJJQPIuT1WVxIqHjOclh7PsroVGjXQrvvhFXZzVy5ql524Sqa11x?=
 =?us-ascii?Q?etqGCvzlD2poAW3gHllr6YwbSbNUkHe4HGgcmHjv/sVQJ45EHYZvrUwxPaWR?=
 =?us-ascii?Q?IqMMc+Pgoas9Vxxfn7nRbciYpjKKoKBImxVcfeahwFHurwvpJwmkC6qn55hY?=
 =?us-ascii?Q?sozYXhyxcQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e22079-2e28-4b36-f64f-08df1e6dbddc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 21:07:59.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIpVSssgIj4lPSw8qT9hxTcNlADZ3tgoGyzg977yB9vHPljCOlJ+PJ/41LHB8LAvEhbIqqa36vK+4o7eajJIdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746

This is a high value thing to print, because it acts as kind of a
bookend, showing the beginning of trying to boot up.

Cc: Danilo Krummrich <dakr@kernel.org>
Fixes: 658c5f0042e6 ("gpu: nova-core: use a single try_pin_init!() block in probe()")"
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

Changes in v2: moved the print statement outside of try_pin_init!().


 drivers/gpu/nova-core/driver.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 291a047e4d86..623d59dcde6e 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -100,6 +100,8 @@ fn probe<'bound>(
         pdev: &'bound pci::Device<Core<'_>>,
         _info: Option<&'bound Self::IdInfo>,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+        dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
+
         try_pin_init!(NovaCore {
             _: {
                 pdev.enable_device_mem()?;

base-commit: 658c5f0042e6e897338dd04330a363aa7022c85d
-- 
2.55.0

