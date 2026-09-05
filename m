Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A387436E473
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788588709; cv=fail; b=Bs8rkOe3PaPbmGlHaUPqxvXajplSLaP3AuFcL/0R6v6DD7uWEVOgwzMN3/rXVXplD/IurHmuW2iqamZu9VqtXe4lix7pgB+pFCVHwyboSUaJdfVVbu9Z1j3e4HeDGV2iWsp5iomMgEFEK+n34UzyCzA+gy/QcKNTdIHbOG8efe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788588709; c=relaxed/simple;
	bh=YVwlNWXvzIpn9L+a/zdWyTz/MhyRdZDDVVpQmAvYFEs=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=txHKAhykmcGi+60ycg1eYBCxN+AyBevFuIm08c5CJRz02HBoixcwxjRzzRk4WZSGZddVA7clZcWAGfQ8bw9lSLTj/YQ6bUjDNfnOwgw6JPloF/WQYPogMjyX0DboVhYI6BnivM1Ew9CJaS32M90dIWh8nWEdTXHFZBLxwUtLrZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mHgZdEB5; arc=fail smtp.client-ip=52.101.57.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mHgZdEB5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRMwGrGeuGblWEGMwIipkL1aG1z3ywsJObzULm24iVbuX+g1bNfez016hUv7blY+Um81PioHJ5y0gNbQwEPGOo2I3yyMhm06zTWx076GsTidNMfdCZVvbN3Mjlq/fFkOn3VHYa1KZVsJ2uM7TAFS6skkQA7vgCAFRzXNDlXVMESGnvIwrCUgUj5U/N8lEPc40xSEt/AtmuIvb6FAmsYVLk+rtTjIGeye/QmLqksAR0XK4NfDiwg3/NsPh+5fLLX6V3xW+3tIIIYt7eF9RNT9ybFJHYue+uIv65nQFCdVQqIVL3H+PxiL8TSIhYh2C+vdacnVGWdHmjn+GbWeBIR4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT6LyIex1KPu3qHroDd/R9cG41Ltot2wTA9/mRxBPRY=;
 b=Rdmlc0jqkti7DnYO4biZtMpXrqIkmSljiMSox7J81qcyy7yC6DZXxC0ffcbiyWSl/Q1KYJPWXjil2jEVR2BU48j8IG/CrxfU2DpwApBfIlqe/OMld+Iw7Azc4iOUeAR5ifK4iZJTGONT2UCvF/Ui6McXextpXQup1eHgs7syTCIaSNeAd7+YxvBPkMybsmYuxqJYPOHwnydEfXQL1QqlrjtG5zHRTBkzbMsC3eQ0kMM0Ko3LW7T3i+EPPnbrfqTy8nHy0CrQ9Z9cE7qtK3OyQ6llZH+J4Jg7UX9Hycl9NdlAbff+V7CvsjIKCxtRVElvD1IPG+zQY7M7O+s6neyeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MT6LyIex1KPu3qHroDd/R9cG41Ltot2wTA9/mRxBPRY=;
 b=mHgZdEB5/wKdut7rrIPCnVgI5nqPNtKkXAtR3Dl7PY3nLUTsLxj6nPofmtyHtMRm8Zq8GdiR4+ssluuAz40mi6ZWtBN+yduHbr5qWUWnGzXCZFPAU+4AGKc6LlFqppbVGXcRfmiJBQEsdqskSDe87HfR22/HnPw+KPuF7zM3SB0dr5imhBiqCMgXe872zkc31SEvrqQNMAJMJW0aduu6kmz0H3mIMx5UG7Bkxp+CyGbFgrqvDZRd5+u1dz6OqpOEAYjec394R7+0nXm7L5EjY+WCVSQYLX3Wtlu9VM3MmdsHw6eYw7rDFnvaBEk+nIx+WcCSqqvtmkg+LSTACml32A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS4PR12MB9561.namprd12.prod.outlook.com (2603:10b6:8:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Sat, 5 Sep
 2026 06:11:34 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Sat, 5 Sep 2026
 06:11:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 15:11:30 +0900
Message-Id: <DL75RX18QG1G.M0BWB9Q6CHP4@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Will Pierce" <wpierce@nvidia.com>
Subject: Re: [PATCH v3 05/14] gpu: nova-core: add the per-architecture GIN
 CPU interrupt HAL
Content-Transfer-Encoding: quoted-printable
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-6-jhubbard@nvidia.com>
In-Reply-To: <20260903031514.1515905-6-jhubbard@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0085.jpnprd01.prod.outlook.com
 (2603:1096:604:218::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS4PR12MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: e99ef69c-15cb-4f7b-16e3-08df0b1488d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|5023799004|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZMJCXBy+Wt36dTTdrM5dOhLCLM+2Y88eWxc5lQPWKsu8ePYy3e7ZYWPYk3639rvkAqWKcO2ruFkYqS9g8YTBzreGktPKNodDawl7Gz6tKol4DVFE565SQtVtRU41lmw1o1unHr73eP6GjdjSJU9Z8VwyNueWfe1f8C8qdHNIcAw6YbV/3cxjxoGxpJGQRWwK99MK/ioi9RLNMA+JU7iX1jUaeWZGIm49riv6Smv6RBP5azstgA2uXbnriSmhKK21tRT9bWyfTQY3zOvK+oZWwhNfPPDZnoabZahew5X5XCS+ZTm4ci1QS8+kGgQ6CLbV45XTEEMMRl+viKNUemZ0eiaBiAqt5HEQFoh9UYzLtU9wUgg1kl2XYRvYX6NgZN8DDHWLol0mycNtgiX5rDCE+7mYA+1KC0fR3/Mu3l1hBP4Z9+UkJLs9YmnfA6O5s2nWTbSkJoc4K6OAvUgbN4y/RfMlZIBfer9ehYJntcYoht4vfsZSiAbUH5haLEIVNQrWGZXR6Egg97q2xvpMU61HTehpRAk9IdfSdLHlYazt6AVx4efzeIUYrdAnrA9AeujbjIT7+4pUqrre4B7xpbuyFq9uRFvFzBhhZL9fdeJfwI1DsA0yzJ2b4PF1XiOEKgseX9q4gvWPjBaS2eeUC03rYeg4EUj9G+H9+lprTtDvD3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTcvSFFkVlIyYytqNEFwaVZQaDJMN2FjcWFMTFJkamtmY01nMXFmV2FUNHI0?=
 =?utf-8?B?V25lSmdLbTg0UFo1WTlCbDhVdXIrRGhKNmlNOVQ4S014Z3ErOExPZDVXalUy?=
 =?utf-8?B?cjg4RzFUR1ZVaFQrUkxsK3dCL005aEcydEtZdjJja1QyOHpnSDZ5WkVaT01o?=
 =?utf-8?B?NmpHaHBra0s4akZSbWFPVWt1ejUxUDJ2UHdTOVVGYmR0NEwrUGpZNEYvVjdZ?=
 =?utf-8?B?Q21JTGk5dTh2ZkdVL2FReGNzTTV0K0ZJSVBId1NUallaM3BJN1dwaGVoUGVH?=
 =?utf-8?B?SnpZSVIyQmZUWE1TWkJBVlUzNitGN3VTVEFNUHZTZkRkR0xpRWV2cXNmbjJx?=
 =?utf-8?B?NDcvNks0Smd0NEx5K2J3VVpKaTl2RHhTWSttK1ZXUjkzTURnNDVHckRzVVBF?=
 =?utf-8?B?amVOUEZrelFqVXpOTFB5clhCNitnWk1ONFY5clBiaXd4dUtiMjFMaCtqZzBJ?=
 =?utf-8?B?SDhnTFFSNnF4WThGcTYveHNhaml2N2dLelYwYjJBTHFCc2pjWVdGOVRpMWVw?=
 =?utf-8?B?U1lMa0JjVXJuclQzZHo4cFVsRVZuTFJpMGRGdEVPY0JTTXg1Zk9QNUlwYmVJ?=
 =?utf-8?B?VytWQU1PSzlSV0p5MXdELzhXaDVGanZydUpya1kxWndLTHU2bmk5VVNpcHNr?=
 =?utf-8?B?WkJncDFjZ1JCN0liZFhJY01OK1hyN0dDVS9CbldOM1R2RmVqNWNDZTVpdHlo?=
 =?utf-8?B?dGEvZkMvSzkvVCsxZTFpMHNsVC9ZTy96ZU9zZ3FjUk1yQkV3aWpmUWxFMklj?=
 =?utf-8?B?R1ZxaXpPcnZIWklZaUY5MitKU0s3NDZTaFM0NTlLL0tqL3VvQWJwOTVvT1ZW?=
 =?utf-8?B?WXBzcDdTbDNIdTNlS2M5SEVOTWo5SkVUeWtjb2FLWTlBZ2ZqZDgrWVBTZXBv?=
 =?utf-8?B?SitoNzF2TmlkbzhhREVkaXE2QVpDdnZQcGhUaTdvWFkxMUMvQ1dBdEVIWGRZ?=
 =?utf-8?B?Mm1Zbm9NMW90T3dSUGc0ZFNFTWxxcmRKMVY1NVVvWFZiclppWDdoUHR5Zmg2?=
 =?utf-8?B?OCtSMGN5V21XUnhDSFhnczNwNTdWcVA5b2F4VnJOWUd6a0pucSt0dVdvem1H?=
 =?utf-8?B?eWVRbUthME5Hd0k2ODc2NFNmZzhRSGhQS1hXNVZMb1FqRklZUFVscjlOTTVS?=
 =?utf-8?B?OFRMMTF3M3FyVGJNeTNzejRPSnRQV04xQzMzVlpBQjZWakQ0NGI0T0RNa2FD?=
 =?utf-8?B?WFY0TmFldzAxZ1R3M3VaZWtXL1BlRUY2ME9LZ2c1aGNQdnArb0UxWmNxd1Yw?=
 =?utf-8?B?T3g4Rzl6Ujc2Z2NzblhReTdpQ3VxOHZhWngzODhSekV5T2JMc1lZWTErN2Vs?=
 =?utf-8?B?WFJ6U0tnSUIrMzlmdHp4RXdaMTNPNG1Xc1FFMkppK0F2VjdtRzB6K3p0ZEFQ?=
 =?utf-8?B?ZzRTU0l1ay9ubzRLamJrbzFwajh0VTVQU1FpSG1mSUFEK3BmRHEwTVpSK2FJ?=
 =?utf-8?B?Qmg2Tlpvd3p6OWlHU2pDMEFOd0NqL1d0TGx1U1V5MzhZSlZWY20xOWdCRzBU?=
 =?utf-8?B?WS9BL2lXcUY5a1Z2RWhEMjVIU0xnMiszQkRnUFZWV2RLZzJmc0Zwc01GQ0hX?=
 =?utf-8?B?N2pJQVE3eHVRQ2ZOblc1NmlOUTRIT1pKM1RXMFliWnUyNVJUbng1OEdXa2xP?=
 =?utf-8?B?dThIbVMxRWw1djZsbUVJS3cyeTJRajkxdWJnTjNvS1NUcXRsQmhGTUcvQzdD?=
 =?utf-8?B?WnJhQkpsbnZWc3FNYkVwRm0za0ZKQkUxOTN4TlVhd2JYQjQzVFVZdXJrRXpt?=
 =?utf-8?B?eE5JRjlxV3VBdW0xbFBpbjJ5cWJqWng2QXZqNHNsYVR2Q1JQMFVNUVVaUDRi?=
 =?utf-8?B?UU9VdS9GZGxWUkp4a0NHQktMTjloZW5lY2Mwa01uQjNuRXFiSGJINHZnNU53?=
 =?utf-8?B?NkpzNG1QSVFqdTArSnV0bUQ4Wm1BKy9Td2Q2VndYNVJSek1ZRTFYelZJZ3lR?=
 =?utf-8?B?eCtNemR2M1BZSHdVM1E4NVFpQ0VWSlFaTHBZL1RuTEt6QUZZcytHQnIrYm1I?=
 =?utf-8?B?MXFiaDUrUkVoK3VQUFdMbUhNa3J2enF4V2NocEdPQWE1djhtc2R0eHhEd0xC?=
 =?utf-8?B?YWo3WG5FdzFObjBadUpDR2NIYTZsNmQ1R2NEdnhYRHFsUmpqNVBab0VyWTRl?=
 =?utf-8?B?a21SVnRFQ241NUxzcms5U0Q1NTVrQjkvT2NCdVVXMnB1MkwyQ21waVpDQmky?=
 =?utf-8?B?Mk5zYldrRUZvNDZBRjNkNG41dHNmZXRnMi9JWWVINkZjTkh4NXpyV1NyV3Iv?=
 =?utf-8?B?K3ViNXBSRTUwSVpnc2ZIV21scGk4TWs0czQ0Uk5ocytueE90RENtT2ErdHdH?=
 =?utf-8?B?aXB6T0lDeHAvWmUyanVUUnIzMGlwV01YdlZPQ0lwd0JMWGJ1VU9oQlNXZ1Ar?=
 =?utf-8?Q?6Q4Y2BD+jEx3oyKeiMgMqWX/H1Y4XVlxkVmB6tTf8bFcb?=
X-MS-Exchange-AntiSpam-MessageData-1: QH1xoaYqLTK7OA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99ef69c-15cb-4f7b-16e3-08df0b1488d6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 06:11:33.7464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB4yghuJMokRmqHbghMSIRYsAg+Ql4TGKJflsQHAIY2BwNDVr8DCKdJW/becGPupsn7/8SRDn3N2Pnn5NArDzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9561

On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
> GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt
> controller. Each PCIe function has its own tree, whose leaf count
> depends on the GPU family.
>
> Message-signaled delivery stops after each edge until the CPU rearms it,
> and the rearm write differs by family and interrupt type:
>
> * Pre-Hopper MSI writes an EOI through the BAR0 PCI configuration space
>   mirror.
>
> * MSI for Hopper and later cycles the TOP enable bits of every serviced
>   subtree.
>
> * MSI-X on any family cycles the bits of the handler's own subtree.
>
> Provide the leaf count and the rearm method through a per-architecture
> interrupt HAL, and name the interrupt type with nova-core's own two
> variants rather than the PCI core's three, which include the
> level-triggered INTx that nova-core never allocates.
>
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Will Pierce <wpierce@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/irq.rs           |  14 ++++
>  drivers/gpu/nova-core/irq/hal.rs       | 106 +++++++++++++++++++++++++
>  drivers/gpu/nova-core/irq/hal/gh100.rs |  29 +++++++
>  drivers/gpu/nova-core/irq/hal/tu102.rs |  28 +++++++
>  4 files changed, 177 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/irq/hal.rs
>  create mode 100644 drivers/gpu/nova-core/irq/hal/gh100.rs
>  create mode 100644 drivers/gpu/nova-core/irq/hal/tu102.rs
>
> diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
> index 3066ceeb850c..d21dee1b89a0 100644
> --- a/drivers/gpu/nova-core/irq.rs
> +++ b/drivers/gpu/nova-core/irq.rs
> @@ -8,5 +8,19 @@
>  //!
>  //! See `Documentation/gpu/nova/core/interrupts.rst`.
> =20
> +mod hal;
>  mod interrupt_tree;
>  mod regs;
> +
> +/// The message-signaled interrupt type a vector allocation obtained.
> +///
> +/// nova-core allocates MSI-X or MSI and nothing else, so the level-trig=
gered INTx that
> +/// [`kernel::pci::IrqType`] also names has no representation here.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(crate) enum MsiType {

This type is module-local and can stay private (same for the `msi_type`
method).
