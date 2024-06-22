\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b''8 b, r16 b32 c d16 f \grace a8 g8.\trill f32 es f8 b,
    b' b, r16 b32 c d16 f \grace f8 es8.\trill d32 c d8 b, \gotoBar "10"
    b4 r b'8. a32 g f8 es16. f32
    d8 b r16 b'32 c d16 f g8. f32 es f8 b,
    r4 r16 b32 c d16 f \grace f8 es8. d32 c d8 b,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b''8 b, r16 b32 c d16 f \grace a8 g8.\trill f32 es f8 b,
    b' b, r16 b32 c d16 f \grace f8 es8.\trill d32 c d8 b, \gotoBar "10"
    b4 r b'8. a32 g f8 es16. f32
    d8 b r16 b'32 c d16 d es8. d32 c d8 b,
    r4 r16 b'32 a b16 d \grace d8 c8. b32 a b8 b,
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    d8 d d d es es d d
    r d d d a a b b \gotoBar "10"
    d4 b'8 b, b'8. a32 g f8 es16 f
    d8 b b'\p b, b' b, b' b,
    r4 b'8 b, f' f, b' b,
  }
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*2 \gotoBar "10"
    b'8 b,16 b r8 f' b a16 g f8 es16 f
    d8 b r4 r r8 f'16 f
    b8 b, r4 r r8 b16 b
  }
}

BassoLyricsA = \lyricmode {
  Fu -- ri -- ae vos di -- vae a -- bys -- si vo --
  la -- te, pro -- pe --
  ra -- te, pro -- "pe -"
}

BassoLyricsB = \lyricmode {
  Gra -- ti -- ae vos di -- vae Par -- nas -- si vo -- %10
  la -- te, pro -- pe --
  ra -- te, pro -- "pe -"
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b8 b b b b b b b
    r b b b f f b b \gotoBar "10"
    b4 b'8 b,16. f'32 b8. a32 g f8 es16 f
    d8 b b'\p b, b' b, b' b,
    r4 b'8 b, f' f, b' b,
  }
}

BassFigures = \figuremode {
  r2 <6 4>4 <5 3>
  r2 <7>
  r1
  r2 <6 4>4 <5 3>
  r2 <7>
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
