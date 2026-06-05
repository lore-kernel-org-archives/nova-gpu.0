Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD4B40E8F4
	for <nova-gpu@lists.linux.dev>; Fri,  5 Jun 2026 13:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665943; cv=fail; b=K4CAtkNi71RIuvs8VfPhp6+ulOPmqGbgFSSzNPWyZtIryRcInBPY4ge+eZxHL/PNxNduz0ctXiIYgTdqE9SlpzcUaoOWZG7vNAX9vrflu1e9m9Y9pM5Gzd63Fn/OdErDZqdB9RUU5VKIi2Cr7orVOjkKCxPy1w/FG7uVaYQwX/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665943; c=relaxed/simple;
	bh=QNA3KR+VCwTCXorFvXU2+jP0niVVQvIoaTCCl40p5Ds=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ERI4WTB/RL+XMAUFjAiJmvqZF9i8OWAEH+kwhe+6j190UGB6by9eHlVLX8gHvYLYHf7y950CtnsNVZa9ltgTAZqWEStqWAqrcImqfSVCCtu8dSwAuFc4I8czhTZPYzJqaSH1ELSOeLZ3pbSElqBXFU5Bm8bojaoW4HSucUuCCRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Llr36Z6/; arc=fail smtp.client-ip=52.101.53.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Llr36Z6/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG0g155tMYH9KvIbSj/g48FRxznaSZH+wY47DhhPaFTdHznO/Fd+j/7NaJg0B4Ms1v5BX7jdRx5zlamNmORUDP7CqRfP4m+wyb4PAvOeBxTbwIEpCOh+BpemubnXeV/ihOgl95o3bWFQnr0tcs3kXKBpT1BAhKhLs07YZlnOUry1RhNGwdpzr7mXrGVFs27nhNhrx+0L6nWVakxvdIpjuti9f9jS5ok6PUEAU9Iv5fbLiPJwDcdGUYhEXt/w638qRjVlMUVsNgGTGQYjyVLF77Qlnu6FAkPuD6KPue6YygtZDa7wpZJgzmsO+1eAHrj3EBdQ5CdIBGFs88g9p8Tm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNA3KR+VCwTCXorFvXU2+jP0niVVQvIoaTCCl40p5Ds=;
 b=AvQu33HBjFXWXHDDz3EuXl4hSX6XJu8mNAUxoe5aDgABGD/FzwZPQkbGhV1gIWLEhRmXy1K/Nx4+PExKPqQa75/QbocujHFJGa5YEuZ1ZLatXo9Z2ExcRIBHiwm/EqPpL8hQ4KzGSTm3VAgkzt37He31w4neD71N4igxs1TjC4xtip3wp0ZeoP0HUWm523y5sWzvCZTpNL+zKQ/O/glXVagBcwZr8llyoxHq+flJLXB7iSRiuNR2lsbzaIQDH32tIlEOht/RwYxW9T/rewVJLqIUqqEGBUukGBiW0ddsTuqleslVor2G2sz1O8QBC1q1skZzNYvzvnLBRPCSrg1KAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNA3KR+VCwTCXorFvXU2+jP0niVVQvIoaTCCl40p5Ds=;
 b=Llr36Z6/5qLLFmFn52SLESfSWkss5g+0x3fEGLTIyPCsup0Cq9/+381h1/6/hiAGzX54ncQlYObswGk7jjfNgsf8binXRXlNWAaJ/wGx0XaKtGWst4/r3DUI5li2A9jKR78nL24d+lH16speao4MmxH2zEOT07uu8jLhCX9R7DleTTgd43iLddcFlExPbpOXUcUSd1Lb+wlhoSVbgKffMpqvGj02czbF/d2GrygffmrLTBftdD4B3YG9EaYveCVZNj5Sibf2uwSBUEQpmheruHrkR4MHtnHCTplDKI0atC0U1LChrqf61HbhlO1Qoyj2jFkDkf1/xCbEjllKXwp6Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 13:25:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 13:25:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 22:25:27 +0900
Message-Id: <DJ15E264IOWK.3O2HF317B5UDR@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH 3/9] gpu: nova-core: return FSP response buffer to
 caller
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-4-zhiw@nvidia.com>
In-Reply-To: <20260604114339.1565660-4-zhiw@nvidia.com>
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: db46cebe-9db7-4d62-9b17-08dec305ea7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|56012099006|11063799006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eY3ry3jJTPMAxdc5PHy74EmtfNBe3I7GoaVo8m3fM1l4mFCZGybUPztEa16WkSRIjj2CGlrwfIdNCGxlXVE2qn2GERjHmOSCUpPdF3XPwoiZ7vEVXtLD1okw8vVXNQbtYR7Zhbak5yAwZTma3sx79w+AdH9SE0d2luL9VMrOI3yubTU4NkBSa6gpVT0inXuJ6fXlB0pIG1TxYyvs3h9lR1Ss/XUspcSL5OeVXNBDOVJFe7saiPBYvwdYw7OaQJQsiuSLSuomYeDvgX21m7y5Eiz2GJero+ODfPKcaPWi13HQaslynDO2PNzxkmYRyeZA+PzZqtYikLKZa/BAdfEjqyaxbEaeNHK+iZ90rBxRBvtVn0BpJauEJ5vuQPUktzZrc0yyVc//4LseciGisY0HHRHKaz3C/Eyr8JbVSkkANeYe8zHTwI/4muu/UTMbPcKUY33B01sMkRVSbDdccJ+1xsyjm8h/3XfPeMN+Q5z7q8OBbpvoNGj8+icM47G3NvOhm36iNl800An1dxOoSF6A/CojRVD+SqKt54jE4dGIKaUOjrpwYDT2LLgSEodoq6WQjVd9FbWm0Ki21SHKjQ7q6VhBejX99zCyAUiu1+W8k/4zg1Y4DuPTPxvYpYw0/hCAUovbv7O6xC5SQWbW7xyMyMkzYCM4nAaQn6DWVV1p4xXMNLVYiRZWzvEmcxpdeXx3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXgrWFNGRFRVdnFPWUczTWVvRFJMSUlZWTdQNk4vUmp2VklvRXJTczIrL0Ux?=
 =?utf-8?B?bFNzUFNLYXk3UmhjVEgvT0lYdFZ3ZnpSV243RWJXR2pyTG5kK0cxQlV3ck5X?=
 =?utf-8?B?VWQzVDY0M3IrNTUyTVFzOVVJWlpyRnRoNXVOVUJVQWl1bnFmcGtqWUxMUlpW?=
 =?utf-8?B?QmdLZHdLQlhUT0dPeXNIZFczV1hUZzdoZ0VJNGFPaHhGZFpKTWJYWkdtNmRk?=
 =?utf-8?B?ZlJZWi96NGVvTnVGdkk5RVBsUlJPVnBmZDk4a1NUT1hyUnlySmYwTkRBU3pS?=
 =?utf-8?B?dXY1cjNYRms2c0d2R0VEeEpQVXY5UU9DWkZDcE9zV1NOMWNyR1ppTnpOV2RL?=
 =?utf-8?B?MXFTQkZMMWlhdkh6Si84aDRtb2J1Nmx6RmczVXgrTzJVbi9zT3dhbGlWcEZm?=
 =?utf-8?B?dTJBTmYyaVEzS3NCZDNVRnVDbDFLRmR4ZWJhaER4MlhBQ1dyMjl4aVJXaDBT?=
 =?utf-8?B?ai9LVlZLVEJqRit6LzhablU0bStxRThkNnFCTExmVDFCTGdORUtHbGJ1VUZG?=
 =?utf-8?B?UE9EQjh3RzhwYi9JUktvdWxQUTBsUUxKQXRhY0dXTWp4aTJRc2V0Mzg3OWRr?=
 =?utf-8?B?Mm9WYUdWSEE3UlJTazhiQ2IvdWkvVnhBMWxUbGF4QjYrMWxqMXF0bTdrUzFm?=
 =?utf-8?B?VHVjUFB3ZGNhZU53SkY5WEdBWTRCZmtjTUh1S3lMNGRLRU9JZEE1YjRTejhw?=
 =?utf-8?B?T1V3b1ZxaG9GNUFSSzZ5dnUzOHZNbXdKNkRFUG81V3VVbGdZWm5rRzdUUXc0?=
 =?utf-8?B?QytwbDFvL2p4dllUZ01RTkJnRVp5M3ltVGRidEp1WEJEV2hGY0hpRnc2UnNp?=
 =?utf-8?B?dHNYRHczaEl6c2VuWDJ3YTVIZFN5NkJEQk1ZUDI2MEpHcWROT2t6VjEyTURw?=
 =?utf-8?B?dE5QaGNGUHpkYW95Ry9ZS2lLcHJ2dUNpdTlqTTkybmFnUFZneUN4WEZQUE5x?=
 =?utf-8?B?RFhmaTY2a201OW1FbGpCZE1IaUw3SWJzZ2NwN0JkaG01YzdrU2xrMTMvbGlS?=
 =?utf-8?B?S09NMTJhdm5SVW4yL2tWd2pxbkNyWTJ3SS9IYmR6TG5JT3ZqM1MvYWs5R2NN?=
 =?utf-8?B?WmZyWTNSSWk4a3JlcjlzcnZZR0lzejk0bzBscVVUUkU1TGF3OGtRdnIxNDJ3?=
 =?utf-8?B?dlNGSWV5cm1EMGJlcVVsKzkyVzFmV1ZxNk1TSjJzK1gzeTROWGIrbHBJZ01p?=
 =?utf-8?B?NmZkT0luVXVpOTU2OVRETnYzMnM1T2JQS3RLZ0dCMGxFZ3V2aWhndVNmbFVK?=
 =?utf-8?B?czJwVDYxZnpnZEhCS0liT0didGxleVlKdWhQQXJObW5OY2dXUFlkcWtIOXJU?=
 =?utf-8?B?T2dLVjJGdUZRbUtYdVhEUjkvaDlPeisyT2RMd3hpY1ZRUCtSajFWK2pMbWdo?=
 =?utf-8?B?MTZ2ZEpDbXVkc20rdDgxU3g5RlM2dGJnWXM5aElRMk9yUVlRaUh3cmd2Y1Vq?=
 =?utf-8?B?czVnTmZEN3lQYUgvWlVaSCtnL3hxTjNOZXRaUzJvT1B4cVB5c002V1ZUOUZn?=
 =?utf-8?B?VHVMQVVUL3lKN0pJRG5Ra2UrOG02TW1yU1dPYXFnd01iTWEwM1pNalZtNUx2?=
 =?utf-8?B?ZG5pR0RUS1Nnelo4UDNGaWFHZGU4RVY3dG9Ra3Z6MTN5MVRkdVhCS2NLZitw?=
 =?utf-8?B?eHd4bkgzVzNYd0dYSHhwdDlIKzlLdW1ZdFcrTXFjZldjUnVpcVRVTEE3NkpE?=
 =?utf-8?B?NGhmTjJCdGN2SHFtNzBEYTM0VmQvUzF0NHp6MjVqUStMUU1admJnUThTYWsy?=
 =?utf-8?B?eTgrdThwVGFQQzN5TjdsUmljVzg1dzQrOU1CSFdxeXdsQkNrb2FjdjNDYmhY?=
 =?utf-8?B?RU5zekMwcnVSUm1DT0FJdCtOWFhOUEVFWmVzTUhWSGhwY0x1MkIvSEYzck1i?=
 =?utf-8?B?a3ZlSUs5SFgyZ3MwYzRoeWFoR1luMmFwdTR6TEVmTFNvNGFOS0U4QnVMYkVs?=
 =?utf-8?B?ZmErQ3Y4QXFnbzhHN2MzN2FaOW9TUnh6RzEvdHhubXV6UmMvbGhCT0IvRmlE?=
 =?utf-8?B?dXRiTW8wcEZ5SmZOc2JGR2ZCUUg2NlErQmhQZUpybHY3RVlOMHp3b0YvNjBU?=
 =?utf-8?B?UHZQa2xKQnJqWXg0bllJVlVSSG1idlNYUkd0OXJBSTUxR1VNMXEyNU1RQy81?=
 =?utf-8?B?UlBrdm12K2tDUXhnRjBxTlhWWTQ3cnlGbUo4VnpMaE1zcTBxSDJ5TUROMFlv?=
 =?utf-8?B?YzlOdWRvS2ZPdUU1b2plNHZOYVJpd1BMckxrbjF4UDVZTGFnT3FUY2JiakdS?=
 =?utf-8?B?cm43Uk9VMWdWeUgyS0RIc1d3QVZlNnIzZHZzclk2NW8zRVpzdHZ2bkZjWXJE?=
 =?utf-8?B?U1Jsb2huVUovV3BFUTFhME5velNFRnN5QWU1R3dHTHZBdkVUY2RRMllKWmF5?=
 =?utf-8?Q?cOEIlp1gjxx6x/SaPgA9YYN/AvYt2q7jVBQ3zpB5WYSUP?=
X-MS-Exchange-AntiSpam-MessageData-1: juL8BXbm3GAB+w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db46cebe-9db7-4d62-9b17-08dec305ea7a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 13:25:31.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UxbQPXFm4XlkelOSaZHkdu//4+JieOmb+OxCmPiFspBAUO50xBllAjv37xZOGlsNbBNq5+DcrIjGFVFL01vAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> Change send_sync_fsp() to return the raw response buffer after
> validating the common MCTP/NVDM headers and error code. This allows
> callers to perform protocol-specific parsing on the response payload,
> which is needed for the upcoming PRC protocol support.
>
> For the existing COT caller, the response buffer is unused.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Same as the previous patch, I intend to merge this quickly as it is a
local follow-up to the FSP support.
