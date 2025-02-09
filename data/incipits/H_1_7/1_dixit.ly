\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    g'16([^\solo a)] h[ c] d8 c16 d h8 c16 d e4
    d r r2
    r8 d4 cis16 cis d8 a h4
    a r r2
    e8 c' h4~ h16 h c d c8 d16 e
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me --
  o:
  Vir -- gam vir -- tu -- tis tu --
  ae
  in splen -- do -- ri -- bus san -- cto -- rum, ex
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r4 c16[^\solo d] e[ fis]
    g8 g, c16[ d] e8 e16[ d] d[ c] h8 h
    r2 r8 d d g
    g16 g fis4 e8 e dis r4
    R1
  }
}

AltoLyrics = \lyricmode {
  do -- nec
  po -- nam in -- i -- mi -- cos tu -- os,
  e -- mit -- tet
  Do -- mi -- nus ex Si -- on:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r8 g^\solo a h a4. g8~
    g fis16[ g] e4 fis r8 g
    a h h8. h16 h8 h h c16 d!
    e[ dis] e[ fis] \grace e8 dis4 e r
  }
}

TenoreLyrics = \lyricmode {
  sca -- bel -- lum pe -- dum __
  tu -- o -- rum. Te --
  cum prin -- ci -- pi -- um in di -- e vir --
  tu -- tis tu -- ae
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 fis8^\solo e16 d g[ f] e[ d] c8[ c']~
    c h16 h a8 g fis[ d] g4
    r2 r4 g8. g16
    d8 dis16 dis e[ fis] g[ a] h8 h, g' e
    c' a16 a h8[ h,] e4 r
  }
}

BassoLyrics = \lyricmode {
  Se -- de a dex -- tris me --
  is, a dex -- tris me -- is,
  Do -- mi --
  na -- re in me -- di -- o in -- i -- mi --
  co -- rum tu -- o -- rum.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g8-\solo g' fis d g16 f e d c8 c'~
    c h a g fis d g e
    cis d a4 d8 fis g g,
    d' dis e g h h, g' e
    c a h a gis e' a g
  }
}

BassFigures = \figuremode {
  r2. <3>4
  <5 2>4. <6>8 r4 <9>
  <6 5> <4>8 <_+> r2
  <4>8 <_+> <9> <6> <4> <_+> <6>4
  r <4>8 <4\+> <6>4. q8
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
