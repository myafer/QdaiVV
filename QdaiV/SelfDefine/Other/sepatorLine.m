

#import "sepatorLine.h"

@implementation sepatorLine

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    
    
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();//获得当前view的图形上下文(context)
    
    CGContextSetLineWidth(context, 0.5);//制定了线的宽度
    
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};//颜色元素
    CGColorRef color=CGColorCreate(colorspace,components);//这两行创建颜色
    CGContextSetStrokeColorWithColor(context, color);//使用刚才创建好的颜色为上下文设置颜色
    
    CGContextSetStrokeColorWithColor(context, kLine_Color);
    
    CGContextMoveToPoint(context, 0, 0);//设置线段的起始点
    if (self.width == 1) {
      CGContextAddLineToPoint(context, 0, self.height);//设置线段的终点
    }else
    {
        CGContextAddLineToPoint(context, self.width, 0);//设置线段的终点
    }
    
    
    CGContextStrokePath(context);//绘制

}


@end
